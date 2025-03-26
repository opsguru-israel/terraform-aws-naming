import requests
import json
import os
import re
import subprocess

cookiecutter_json = f"{os.getcwd()}/cookiecutter.json"
aws_provider_repo_url = "https://github.com/hashicorp/terraform-provider-aws.git"
aws_provider_docs_path = "website/docs/r"
local_dir = "._tmp_terraform-provider-aws"
default_data = {}
ln = 2
category_pattern = r'^subcategory: "(?:.*\((?P<inside>[^)]*)\).*|(?P<full>.*))"$'


def runcommand(command, error_message):
    proc = subprocess.Popen(
        command,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        shell=True,
        universal_newlines=True,
    )
    std_out, std_err = proc.communicate()
    if proc.returncode != 0:
        print(f"{error_message}: {std_err.strip()}")
        return False, std_out.strip()
    return True, std_out.strip()


def sparse_checkout():
    current_dir = os.getcwd()
    success, _ = runcommand(
        f"git clone --depth 1 --no-checkout {aws_provider_repo_url} {local_dir}",
        'Clonning "terraform-provider-aws" repo failed with',
    )
    if not success:
        exit(1)
    os.chdir(local_dir)
    success, _ = runcommand(
        f"git sparse-checkout set {aws_provider_docs_path}",
        "Sparse checkout failed with",
    )
    if not success:
        exit(1)
    success, _ = runcommand("git checkout", "Checkout failed with")
    if not success:
        exit(1)
    os.chdir(current_dir)


def update_resources():
    if not os.path.isdir(local_dir):
        os.makedirs(local_dir)
    sparse_checkout()


def remove_resources():
    if os.path.exists(local_dir):
        for root, dirs, files in os.walk(local_dir, topdown=False):
            for file in files:
                os.remove(os.path.join(root, file))
            for dir in dirs:
                os.rmdir(os.path.join(root, dir))
        os.rmdir(local_dir)


def get_aws_resource_category(f):
    try:
        with open(f, "r") as file:
            for current_ln, line in enumerate(file, start=1):
                if current_ln == ln:
                    match = re.search(category_pattern, line)
                    if match:
                        # if the string contains parentheses, group 'inside' is populated, otherwise, group 'full' holds the full string.
                        result = (
                            match.group("full")
                            if match.group("full") is not None
                            else match.group("inside")
                        )
                        return result
                    else:
                        return "Not available"
    except FileNotFoundError:
        print(f"Error: The file at {f} was not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

    return None


def make_resources():
    resources = {}
    for root, dirs, files in os.walk(os.path.join(local_dir, aws_provider_docs_path)):
        for file in files:
            resource_type = os.path.basename(file).split(".")[0]
            f = os.path.join(root, file)
            category = get_aws_resource_category(f)
            resources[resource_type] = {"category": category}
    return resources


def fetch_provider_version(provider):
    url = f"https://registry.terraform.io/v2/providers/hashicorp/{provider}/provider-versions"
    response = requests.get(url).json()
    version = response["data"][-1]["attributes"]["version"]
    return version


def update_defaults():
    update_resources()
    resources = make_resources()
    remove_resources()
    random_provider_version = fetch_provider_version("random")
    with open(
        cookiecutter_json,
        "r",
    ) as file:
        data = json.load(file)
        data["random_provider_version"] = random_provider_version
        data["__aws_resources"] = resources
    with open(
        cookiecutter_json,
        "w",
    ) as file:
        json.dump(data, file, indent=4)


update_defaults()
