<?php

namespace App\Controllers;

class Base extends \MvcCore\Controller {

	public function PreDispatch () {
		parent::PreDispatch();
		if ($this->viewEnabled) {
			$this->_preDispatchSetUpBundles();
			$this->view->basePath = $this->request->GetBasePath();
			$this->view->currentRouteCssClass = str_replace(
				':', '-', strtolower(
					$this->router->GetCurrentRoute()->GetName()
				)
			);
		}
	}

	private function _preDispatchSetUpBundles () {
		\MvcCore\Ext\Views\Helpers\Assets::SetGlobalOptions(
			(array) $this->GetConfigSystem()->assets
		);
		$static = $this->application->GetPathStatic();
		$this->view->Css('fixedHead')
			->Append($static . '/css/components/resets.css')
			->Append($static . '/css/components/old-browsers-warning.css')
			->AppendRendered($static . '/css/components/fonts.css')
			->AppendRendered($static . '/css/components/forms-and-controls.css')
			->AppendRendered($static . '/css/components/content-buttons.css')
			->AppendRendered($static . '/css/components/content-tables.css')
			->AppendRendered($static . '/css/layout.css')
			->AppendRendered($static . '/css/content.css');
		$this->view->Js('fixedHead')
			->Append($static . '/js/libs/class.min.js')
			->Append($static . '/js/libs/ajax.min.js')
			->Append($static . '/js/libs/Module.js');
		$this->view->Js('varFoot')
			->Append($static . '/js/Front.js');
	}
}
