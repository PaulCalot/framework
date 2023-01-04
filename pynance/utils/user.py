# TODO: make better functions
import os
from configparser import ConfigParser
from pathlib import Path

def load_user_cfg():
    config = ConfigParser()
    path_to_user_cfg = Path(os.environ['USERCFG']).resolve()
    config.read_file(open(path_to_user_cfg))
    return config

def get_item_from_user_cfg(section, item):
    return get_section_from_user_cfg(section)[item]

def get_section_from_user_cfg(section):
	config = load_user_cfg()
	return config[section]

def get_path_to_data():
    return Path(get_item_from_user_cfg("pie", "path_to_data"))  

def get_path_to_results():
    return Path(get_item_from_user_cfg("pie", "path_to_results"))

def get_path_to_pretrained_models():
    return Path(get_item_from_user_cfg("pie", "path_to_pretrained_models"))

def get_path_to_config_files():
    return Path(get_item_from_user_cfg("pie", "path_to_configuration_file"))
