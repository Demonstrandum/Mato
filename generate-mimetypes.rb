require 'mimetype_xml'
require 'toml'

xml = MimetypeXML::Generate.toml_file(
  :file      => './custom-mime.toml',
  :xml_dir   => './.xml',
  :icon_pack => '~/.icons/Mato'
)

files = xml.write_files
files.install
