<?php

use PKP\plugins\ThemePlugin;
class FachaThemePlugin extends ThemePlugin {
    public function init() {
        $this->setParent('defaultthemeplugin');

        $this->addStyle('child-stylesheet', 'styles/index.less');
	}
    function getDisplayName() {
        return 'Facha Theme';
    }
    function getDescription() {
        return 'first attempt';
    }
}
