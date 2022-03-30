"""Used for better handling of imports"""
import os, sys
# adds parent folder of scripts folder to sys path (root folder)
sys.path.append(os.path.dirname(os.path.dirname(os.path.realpath(__file__))))

