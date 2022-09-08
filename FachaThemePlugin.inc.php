<?php

import('lib.pkp.classes.plugins.ThemePlugin')

class FachaThemePlugin extends ThemePlugin
{
    public function isActive()
    {
        return parent::isActive();
    }
    public function init()
    {
        $this->addStyle('stylesheet', 'styles/index.less');
    }
    public function getDisplayName()
    {
        return __('Facha Theme');
    }
    public function getDescription()
    {
        return __('seguimos');
    }

}
