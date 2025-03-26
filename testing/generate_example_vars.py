import os
import marko
import hcl2
import json
import tempfile  # Import tempfile module

def extract_hcl_from_markdown(markdown_file):
    """
    Extracts HCL code from a given markdown file. This is the expected
    Usage example, containing a real definition of how to use the module.

    Args:
    markdown_file (str): Path to the markdown file.

    Returns:
    str: Extracted HCL code as a string.
    """
    hcl_code = ""
    with open(markdown_file, "r", encoding="utf-8") as f:
        markdown_text = f.read()
    doc = marko.parse(markdown_text)
    for child in doc.children:
        if isinstance(child, marko.block.FencedCode):  # Check if the block is a fenced code block
            if child.lang == "hcl":  # Check if the language of the code block is HCL
                hcl_code = child.children[0].children.strip()  # Extract the HCL code
    return hcl_code

def extract_element(v):
    """
    Returns the variable values as a string, if the source is a string or a list
    """
    if isinstance(v, list):
        return v[0]
    elif isinstance(v, str):
        return v
    else:
        raise ValueError("Unsupported type. The variable should be a string or a list.")

def convert_hcl_to_vars(input_hcl, output_file):
    """
    Converts HCL code to Terraform variable definitions and writes them to a file.

    Args:
    input_hcl (str): HCL code as a string.
    output_file (str): Path to the output file.
    """
    # Create a temporary file to store the HCL code
    with tempfile.NamedTemporaryFile(mode='w+', delete=False, suffix='.tf') as temp_file:
        temp_file.write(input_hcl)
        temp_file.flush()  # Ensure the content is written to the file

        # Read the temporary file and parse it as HCL
        temp_file.seek(0)
        dict = hcl2.load(temp_file)

    # Extract variables from the parsed HCL and write them to the output file
    with open(output_file, "w", encoding="utf-8") as file_write:
        for module, vars in dict["module"][0].items():
            for k, v in vars.items():
                if k != "source" and not k.startswith("__"):
                    element = extract_element(v)
                    # https://developer.hashicorp.com/terraform/language/expressions/types#types
                    w = json.dumps(element)
                    file_write.write(f"{k} = {w}\n")


if __name__ == "__main__":
    output_file = "readme-example.auto.tfvars"
    hcl_code = extract_hcl_from_markdown("README.md")

    if hcl_code:
        convert_hcl_to_vars(hcl_code, output_file)
        print(f"{output_file} file generated successfully.")
    else:
        print("No HCL code found in the README.md file.")
