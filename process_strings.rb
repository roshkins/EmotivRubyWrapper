lines = File.readlines("./c_headers.txt").map{|line| line.strip}.join(" ").split(";");
statements = lines.map do |line|
	m = line.match(/\w+ (\b\w+\b) (\w+)\((.+)\)/)
  next if m.nil?
	types = m[3].to_s.split(",").map do |argument|
		type = argument.split(" ")[0...-1].map{|word| word.strip}
		retval = ""
		if /\*/ =~ type.join(" ")
			retval = "pointer"
		elsif /unsigned/ =~ type[0]
			retval = "u"
			type.shift
			retval += type.shift
    else
      retval = type.shift
		end
		retval.empty? ? "" : ":" + retval
	end.select{|arg| !arg.empty?}.join(",")
	
	"attach_function :#{m[2]}, [#{types}], :#{m[1]}"
end

File.write( "./ruby_headers.txt", statements.join("\n"))
			

