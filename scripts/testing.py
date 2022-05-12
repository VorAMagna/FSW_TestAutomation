from mks_api.etc.server_handling import get_im_server_handler, get_si_server_handler
from mks_api.im.ImDocument import ImDocument
from mks_api.si.SiMember import SiMember
from mks_api.si.SiAdapter import SiAdapter

si_adapter = SiAdapter()



server_handler = get_si_server_handler()

server_handler.switch('MPT_Lannach')


lannach_file = SiMember(r'C:\Sandbox\Product_Group\SW\Development\CC\CC_Composition\CC_Modules\InputC02\InputC02.mdl')
#lannach_file.submit(cp, 'Updated!')

server_handler.switch('MPT_StValentin')

valentin_file = SiMember(r'C:\Sandbox\Projects\INT_018_Product_Platform_EDrive\SW\STD\Development\ED\FSW_units\PFMEndEC01\PFMEndEC01.mdl')

i = 1
