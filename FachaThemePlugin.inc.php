<?php
use APP\facades\Repo;

import('lib.pkp.classes.plugins.ThemePlugin');

class FachaThemePlugin extends ThemePlugin {

  public function isActive() {
    if (defined('SESSION_DISABLE_INIT')) return true;
    return parent::isActive();
  }
  public function init()
  {

            $request = Application::get()->getRequest();

    // Load jQuery from a CDN or, if CDNs are disabled, from a local copy.
    $min = Config::getVar('general', 'enable_minified') ? '.min' : '';
    $jquery = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jquery/jquery' . $min . '.js';
    $jqueryUI = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jqueryui/jquery-ui' . $min . '.js';
    // Use an empty `baseUrl` argument to prevent the theme from looking for
    // the files within the theme directory
    $this->addScript('jQuery', $jquery, ['baseUrl' => '']);
    $this->addScript('jQueryUI', $jqueryUI, ['baseUrl' => '']);

        // Load Bootsrap's dropdown
    $this->addScript('popper', 'js/lib/popper/popper.js');
    $this->addScript('bsUtil', 'js/lib/bootstrap/util.js');
    $this->addScript('bsDropdown', 'js/lib/bootstrap/dropdown.js');

    // $this->addMenuArea(['primary', 'user']);



    

    $this->addStyle('stylesheet', 'styles/index.less');
    		HookRegistry::register ('TemplateManager::display', array($this, 'loadTemplateData'));
  }
  public function getDisplayName()
  {
    return __('FachaTheme');
  }
  public function getDescription()
  {
    return __('seguimos');
  }

  public function loadTemplateData($hookName, $args) {

    $templateMgr = $args[0];
    $lasSeries = Repo::section()
      ->getCollector()
      ->getMany();

    $templateMgr->assign('lasSeries', $lasSeries);
    return false;

	}

}
