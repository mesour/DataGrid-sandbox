<?php

namespace App\Presenters;

use Mesour\DataGrid\BasicGrid;
use Mesour\DataGrid\Grid;
use Nette,
    App\Model,
    Mesour\DataGrid\NetteDbDataSource;


class TestsPresenter extends BasePresenter
{

    protected function createComponentCustomFilterDataGrid($name)
    {
        $source = new NetteDbDataSource($this->demo_model->getUserSelection());

        $grid = new Grid($this, $name);

        $grid->setPrimaryKey('user_id');

        $grid->setDataSource($source);

        $subItems = $grid->enableSubItems();

        $subItems->addGridItem('groups', 'User groups', $this->getSubGrid())
            ->setCallback(function (BasicGrid $sub_grid, $data) {
                $source = new NetteDbDataSource($this->demo_model->getUserGroupsSelection($data['user_id']));

                $sub_grid->setDataSource($source);
            });

        $grid->enableFilter($this['userFilter']); // here set your form component

        $filter_values = $grid->getFilterValues(); // get values from filter

        // using custom filtering
        if (empty($filter_values) === FALSE) {
            if (isset($filter_values['name_surname']) && !empty($filter_values['name_surname'])) {
                $source->where('CONCAT(name, " ", surname) LIKE ?', '%' . $filter_values['name_surname'] . '%');
            }
            if (isset($filter_values['email']) && !empty($filter_values['email'])) {
                $source->where('email LIKE ?', '%' . $filter_values['email'] . '%');
            }
            if (isset($filter_values['user_id']) && !empty($filter_values['user_id'])) {
                $source->where('user_id = ?', $filter_values['user_id']);
            }
        }

        $grid->addText('name', 'Name');

        $grid->addText('surname', 'Surname');

        $grid->addText('email', 'E-Mail');

        $grid->addNumber('amount', 'Amount')
            ->setDecimals(2)
            ->setDecimalPoint(',')
            ->setThousandsSeparator(' ');

        $grid->addDate('last_login', 'Last login')
            ->setFormat('j.n.Y H:i:s');

        return $grid;
    }

    private function getSubGrid()
    {
        $_sub_grid = new BasicGrid;

        $_sub_grid->setPrimaryKey('id');

        $_sub_grid->enablePager(5);

        $_sub_grid->enableEditableCells();

        $_sub_grid->onEditCell[] = $this->editCell;

        $_sub_grid->enableSorting();

        $_sub_grid->onSort[] = $this->editSort;

        $_sub_grid->addText('description');

        $_sub_grid->addText('name');

        $selection = $_sub_grid->enableRowSelection();

        $selection->addLink('Active')
            ->onCall[] = $this->activeSelected;

        $selection->addLink('Unactive')
            ->setAjax(FALSE)
            ->onCall[] = $this->unactiveSelected;

        $selection->addLink('Delete')
            ->setConfirm('Really delete all selected users?')
            ->onCall[] = $this->deleteSelected;

        return $_sub_grid;
    }

    protected function createComponentUserFilter()
    {
        $form = new Nette\Application\UI\Form;

        $form->addText('user_id', 'ID')->setAttribute('placeholder', 'ID');

        $form->addText('name_surname', 'Name, Surname')->setAttribute('placeholder', 'Name, Surname');

        $form->addText('email', 'E-mail')->setAttribute('placeholder', 'E-mail');

        $form->addSubmit('filter', 'Filter'); // required button with name filter

        $form->addSubmit('reset', 'Reset')
            ->controlPrototype->class('btn btn-danger'); // required button with name reset

        return $form;
    }

}
