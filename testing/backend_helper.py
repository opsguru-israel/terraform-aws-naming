import os
import hashlib
from pathlib import Path

def generate_backend_config(test_dir: str, module_name: str) -> str:
    """
    Generates a unique backend configuration for tests.

    Args:
        test_dir: Directory where the test is running
        module_name: Name of the test (used to create unique state file)

    Returns:
        Path to the generated backend.tf file
    """

    # Backend configuration
    backend_config = f'''terraform {{
      backend "local" {{
        path = "{module_name}.tfstate"
      }}
    }}'''
    print(backend_config)

    # Write backend configuration
    backend_file = os.path.join(test_dir, "backend.tf")
    with open(backend_file, "w") as f:
        f.write(backend_config)

    return backend_file

def cleanup_backend_config(test_dir: str) -> None:
    """
    Removes the backend.tf file after tests are complete.
    """
    backend_file = os.path.join(test_dir, "backend.tf")
    if os.path.exists(backend_file):
        os.remove(backend_file)
