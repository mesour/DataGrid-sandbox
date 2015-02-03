<?php

namespace App\Presenters;

use Nette,
    App\Model,
    Mesour\DataGrid\GridTree,
    Mesour\DataGrid\_GridTree,
    Mesour\DataGrid\NetteDbDataSource;


/**
 * Tree presenter.
 */
class TreePresenter extends BasePresenter {

	protected function createComponentTreeDataGrid($name) {
		$source = new NetteDbDataSource($this->demo_model->getPageSelection());

		$source->orderBy('sort');

		$table_id = 'page_id';

		$source->setPrimaryKey($table_id);

		$source->setParentKey('parent_id'); //! require set parent key, default = "parent_id"

		//! here create instance \DataGrid\GridTree
		$grid = new _GridTree($this, $name);

		$grid->setDataSource($source);

		$grid->enableSorting(); // enable sorting

		$grid->onSort[] = $this->editSort; // here set sort callback

		$selection = $grid->enableRowSelection();

		$selection->addLink('Active')
		    ->onCall[] = $this->activeSelected;

		$selection->addLink('Active')
		    ->onCall[] = $this->unactiveSelected;

		$grid->addText('name', 'Name')
		    ->setOrdering(FALSE);

		return $grid;
	}

}
