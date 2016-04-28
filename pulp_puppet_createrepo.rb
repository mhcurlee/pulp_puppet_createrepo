#!/usr/bin/env ruby

# Creates PULP_MANIFEST file

require 'digest'


mypwd = Dir.pwd 

files = Dir.entries(mypwd)


file = File.open(mypwd + "/PULP_MANIFEST", "w")



files.each do |file_name|
  if !File.directory?(file_name) && file_name != "PULP_MANIFEST" 

   file.write( file_name + ',' + Digest::SHA2.hexdigest(File.read(file_name)).to_s + ',' + File.size(file_name).to_s + "\n")
  
  end
end


file.close 

