-- Build script for returntogrid
packageversion="0.1"
packagedate="2018/08/20"

module   = "returntogrid"
ctanpkg  = "returntogrid"

checkengines = {"pdftex", "luatex"}
checkconfigs = {"build"}
checkruns = 5

tagfiles = {"source/*.md",
            "source/**/*.sty",
            "source/*.tex",
            "source/**/*.lua"}

sourcefiledir = "./source"
docfiledir = "./source"

typesetfiles = {"returntogrid.tex"}
typesetruns =  10

docfiles = {"source/*.tex", "source/*.pdf"}

textfiles= {"source/README.md"}
packtdszip   = false
installfiles = {
                "**/*.sty","**/*.lua"
               }  
               
sourcefiles  = {
                "**/*.sty",
                "**/*.lua"
               }
            

function update_tag (file,content,tagname,tagdate)
 tagdate = string.gsub (packagedate,"-", "/")
 if string.match (file, "%.sty$" ) then
  content = string.gsub (content,  
                         "\\ProvidesExplPackage {(.-)} {.-} {.-}",
                         "\\ProvidesExplPackage {%1} {" .. tagdate.."} {"..packageversion .. "}")
  return content                         
 elseif string.match (file, "%.def$") then
  content = string.gsub (content,  
                         "\\ProvidesExplFile {(.-)} {.-} {.-}",
                         "\\ProvidesExplFile {%1} {" .. tagdate.."} {"..packageversion .. "}")                         
  return content                         
 elseif string.match (file, "%.md$") then
   content = string.gsub (content,  
                         "Packageversion: %d%.%d",
                         "Packageversion: " .. packageversion )
   content = string.gsub (content,  
                         "Packagedate: %d%d%d%d/%d%d/%d%d",
                         "Packagedate: " .. tagdate )                      
   return content
 elseif string.match (file, "%.lua$" ) then
   content = string.gsub (content,  
                         "Packageversion: %d%.%d",
                         "Packageversion: " .. packageversion )
   content = string.gsub (content,  
                         "Packagedate: %d%d%d%d/%d%d/%d%d",
                         "Packagedate: " .. tagdate )                      
   return content
 elseif string.match (file, "%.tex$" ) then
   content = string.gsub (content,  
                         "package@version{%d%.%d}",
                         "package@version{" .. packageversion .."}" )
   content = string.gsub (content,  
                         "package@date{%d%d%d%d/%d%d/%d%d}",
                         "package@date{" .. packagedate .."}" )                      
   return content  
 end
 return content
 end

                            


kpse.set_program_name ("kpsewhich")
if not release_date then
 dofile ( kpse.lookup ("l3build.lua"))
end
