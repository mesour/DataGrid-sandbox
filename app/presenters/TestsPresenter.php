<?php

namespace App\Presenters;

use Mesour\DataGrid\Components\DropDown;
use Mesour\DataGrid\Components\DropDownLink;
use Mesour\DataGrid\Components\Link;
use Mesour\DataGrid\Grid;
use Nette,
    App\Model,
    Mesour\DataGrid\GridTree,
    Mesour\DataGrid\NetteDbDataSource;


class TestsPresenter extends BasePresenter {

	public function renderDefault() {
		$dropDown = new DropDown();

		$dropDown->setPresenter($this);

		$dropDown->addHeader('Test header 1')
		    ->setAttribute('class', 'my-class')
		    ->setAttribute('test', 'my-test');

		$dropDown->addLink('Test 1', new Link('Full:'))
		    ->setAttribute('class', 'my-class')
		    ->setAttribute('test', 'my-test');

		$dropDown->addSeparator()
		    ->setAttribute('class', 'my-class')
		    ->setAttribute('test', 'my-test');

		$dropDown->addHeader('Test header 2')
		    ->setAttribute('class', 'my-class')
		    ->setAttribute('test', 'my-test');

		$dropDown->addLink('Test 2', new Link('Full:'))
		    ->setAttribute('class', 'my-class')
		    ->setAttribute('test', 'my-test')
		    ->onRender[] = function ($data, DropDownLink $link) {
			if($data['test'] === 1) {
				$link->setDisabled();
			}
		};

		$dropDown->addLink('Test 3', new Link('Full:'))
		    ->setAttribute('class', 'my-class')
		    ->setConfirm('Really?')
		    ->setAttribute('test', 'my-test');

		$this->template->dropDown = $dropDown->create(array(
		    'test' => 1
		));
	}

}
