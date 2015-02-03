<?php

namespace App\Presenters;

use Nette,
    App\Model,
    \DataGrid\Grid,
    \DataGrid\Column,
    \DataGrid\GridTree,
    \DataGrid\DibiDataSource,
    \DataGrid\NetteDbDataSource,
    \DataGrid\Components\Link,
    \DataGrid\Components\Button,
    \DataGrid\Components\StatusButton,
    \DataGrid\Components\ButtonsContainer;

/**
 * @author     Matouš Němec
 */
class TestControl extends \Nette\Application\UI\Control {

	public function render() {
		$this->template->setFile(dirname(__FILE__) . '/templates/Test.latte');
		$this->template->render();
	}

	protected function createComponentTestDataGrid($name) {
		$source = new NetteDbDataSource($this->presenter->demo_model->getUserSelection());

		$table_id = 'user_id';

		$grid = new Grid($source, $this, $name);

		$grid->column(new Column\Text(array(
		    Column\Text::ID => 'name',
		    Column\Text::TEXT => 'Name'
		)));

		$grid->column(new Column\Text(array(
		    Column\Text::ID => 'surname',
		    Column\Text::TEXT => 'Surname'
		)));

		$grid->column(new Column\Text(array(
		    Column\Text::ID => 'email',
		    Column\Text::TEXT => 'Email'
		)));

		$dropdown = new Column\Dropdown(array(
		    Column\Dropdown::TEXT => 'Actions',
		    Column\Dropdown::TYPE => 'btn-danger',
		));
		$dropdown->addHeader('Dropdown header');
		$dropdown->addLink('deleteUser!', 'Test link', array(
		    'id' => '{' . $table_id . '}'
		), TRUE, 'test');
		$dropdown->addLink('DataGrid:editUser', 'Test link 2', array(
		    'id' => '{' . $table_id . '}'
		));
		$dropdown->addSeparator();
		$dropdown->addHeader('Dropdown header 2');
		$dropdown->addLink('DataGrid:editUser', 'Test link 3', array(
		    'id' => '{' . $table_id . '}'
		));

		$grid->column($dropdown);

		return $grid;
	}
	
}