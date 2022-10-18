install:
	bash dependecycheck.sh
	bash autoinstall.sh

set-fr:
	bash set_fr.sh
set-en:
	bash set_en.sh

set-stock-shortcut:
	bash set_stock_shortcut.sh
set-nostock-shortcut:
	bash set_nostock_shortcut.sh

install-fr-stock-shortcut: install set-fr set-stock-shortcut
install-fr-nostock-shortcut:install set-fr set-nostock-shortcut
install-en-stock-shortcut: install set-en set-stock-shortcut
install-en-nostock-shortcut: install set-en set-nostock-shortcut
