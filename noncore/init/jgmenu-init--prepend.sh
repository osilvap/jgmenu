# This shell script fragment is designed to be sourced by jgmenu-init.sh

prepend__terminals="x-terminal-emulator terminator uxterm xterm gnome-terminal \
lxterminal qterminal urxvt rxvt xfce4-terminal konsole sakura st"

prepend__browsers="firefox iceweasel chromium midori"

prepend__file_managers="pcmanfm thunar nautilus caja"

prepend__add () {
	printf "%b\n" "$@" >>"${prepend_file}"
}

prepend__add_terminal () {
	test -e ${prepend_file} && for x in ${prepend__terminals}
	do
		if grep -i ${x} ${prepend_file} >/dev/null 2>&1
		then
			say "prepend.csv already contains a terminal entry"
			return
		fi
	done
	for x in ${prepend__terminals}
	do
		if type ${x} >/dev/null 2>&1
		then
			prepend__add "Terminal,${x},utilities-terminal"
			printf "Prepend %b\n" "${x}"
			break
		fi
	done
}

prepend__add_browser () {
	test -e ${prepend_file} && for x in ${prepend__browsers}
	do
		if grep -i ${x} ${prepend_file} >/dev/null 2>&1
		then
			say "prepend.csv already contains a browser entry"
			return
		fi
	done
	for x in ${prepend__browsers}
	do
		if type ${x} >/dev/null 2>&1
		then
			prepend__add "Browser,${x},${x}"
			printf "Prepend %b\n" "${x}"
			break
		fi
	done
}

prepend__add_file_manager () {
	test -e ${prepend_file} && for x in ${prepend__file_managers}
	do
		if grep -i ${x} ${prepend_file} >/dev/null 2>&1
		then
			say "prepend.csv already contains a file manager entry"
			return
		fi
	done
	for x in ${prepend__file_managers}
	do
		if type ${x} >/dev/null 2>&1
		then
			prepend__add "File manager,${x},system-file-manager"
			printf "Prepend %b\n" "${x}"
			break
		fi
	done
}

prepend_items () {
	prepend__add_terminal
	prepend__add_browser
	prepend__add_file_manager
	prepend__add "^sep()"
}
