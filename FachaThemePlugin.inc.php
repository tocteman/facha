<?php

use PKP\plugins\ThemePlugin;
use PKP\session\SessionManager;


class FachaThemePlugin extends ThemePlugin
{
    public function isActive()
    {
        if (SessionManager::isDisabled()) {
            return true;
        }
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
