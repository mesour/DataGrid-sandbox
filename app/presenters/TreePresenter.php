<?php

namespace App\Presenters;

use Nette,
    App\Model,
    Mesour\DataGrid\GridTree,
    Mesour\DataGrid\_GridTree,
    Mesour\DataGrid\NetteDbDataSource;


class TreePresenter extends BasePresenter {

	protected function createComponentTreeDataGrid($name) {
		$source = new NetteDbDataSource($this->demo_model->getPageSelection());

		$source->orderBy('sort');

		$table_id = 'page_id';

		$source->setParentKey('parent_id'); //! require set parent key, default = "parent_id"

		//! here create instance \DataGrid\GridTree
		$grid = new GridTree($this, $name);

		$grid->onRenderRow[] = function(\Mesour\DataGrid\Render\Row $row, $rowData) {
			$row->setAttribute('class', 'test');
		};

		$grid->setPrimaryKey($table_id);

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
