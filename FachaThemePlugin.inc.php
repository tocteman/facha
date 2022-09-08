<?php

import('lib.pkp.classes.plugins.ThemePlugin');

class FachaThemePlugin extends ThemePlugin {

  public function isActive() {
    if (defined('SESSION_DISABLE_INIT')) return true;
    return parent::isActive();
  }
  public function init()
  {
    $this->addStyle('stylesheet', 'styles/index.less');
  }
  public function getDisplayName()
  {
    return __('FachaTheme');
  }
  public function getDescription()
  {
    return __('seguimos');
  }

}
