import pytest
import tftest
import json
import sys
import pathlib

# inlude path to helpers script
sys.path.insert(0, (str(pathlib.Path(__file__).parent.parent.resolve()) + "/testing/"))

import generate_example_vars

tests_dir = str(pathlib.Path(__file__).parent)
module_dir = str(pathlib.Path(__file__).parent.parent)


@pytest.fixture
def apply():
    tf = tftest.TerraformTest(module_dir)
    hcl_code = generate_example_vars.extract_hcl_from_markdown(
        module_dir + "/README.md"
    )
    generate_example_vars.convert_hcl_to_vars(
        hcl_code, tests_dir + "/readme-example.auto.tfvars"
    )
    tf.setup(extra_files=[tests_dir + "/readme-example.auto.tfvars"])
    tf.apply()
    yield tf.output()
    tf.destroy()


def test_outputs(apply):
    print_output(apply)
    for item in ["delimiter", "name", "name_unique"]:
        assert type(apply[item]) is str
    assert apply["delimiter"] == "-"
    assert apply["name"] == "clientname-dev-euw1-webassets"
    assert apply["name_unique"].startswith("clientname-dev-euw1-webassets")
    assert type(apply["tags"]) is dict
    for item in ["Description", "Environment", "Location", "ManagedBy"]:
        assert type(apply["tags"][item]) is str


def print_output(output):
    deserialized_output = dict(
        (key, value)
        for key, value in output.__dict__.items()
        if not callable(value) and not key.startswith("__")
    )["_raw"]
    print("Terraform output:\n")
    print(json.dumps(deserialized_output, indent=2))
