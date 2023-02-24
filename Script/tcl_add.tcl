create_project -force Assignment [pwd]/Assignment -part xc7a35tcpg236-1
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
update_compile_order -fileset sources_1

foreach m_file $argv {
	add_files -norecurse $m_file
		update_compile_order -fileset sources_1
}


close_project
