<?php

namespace App\Presenters;

use Nette,
	App\Model;


abstract class BasePresenter extends Nette\Application\UI\Presenter
{
	/**
	 * @var \App\Model\DemoModel
	 */
	protected $demo_model;

	/**
	 * @var \DibiConnection
	 */
	protected $dibiConnection;

	public function __construct(\App\Model\DemoModel $demo_model) {
		$this->demo_model = $demo_model;
	}


	public function injectDatabase(\DibiConnection $dibiConnection) {
		$this->dibiConnection = $dibiConnection;
	}

	public function afterRender() {
		\Tracy\Debugger::getBar()->addPanel(new Nette\Bridges\DatabaseTracy\ConnectionPanel($this->demo_model->getDatabase()->getConnection()));
	}

	public function actionChangeStatusUser($id, $status) {
		$this->setView('ajax');
		$this->handleChangeStatusUser($id, $status);
	}

	public function actionDeleteUser($id) {
		$this->setView('ajax');
		$this->handleDeleteUser($id);
	}

	public function handleDeleteUser($id) {
		$this->flashMessage('User is deleted. (not really).', 'alert-success');
		$this->redirect('this');
	}

	public function handleChangeStatusUser($id, $status) {
		$this->flashMessage('Satatus changed to '.$status.'. (not really)', 'alert-success');
		$this->redrawControl();
	}

	public function activeSelected($selected_items) {
		print_r($selected_items);
		die;
	}

	public function unactiveSelected($selected_items) {
		print_r($selected_items);
		die;
	}

	public function deleteSelected($selected_items) {
		print_r($selected_items);
		die;
	}

	public function editCell() {
		print_r(func_get_args());
		die;
	}

	public function editSort() {
		//print_r(func_get_args());
		//die;
	}

	public function actionChangeStatusPage($id, $status) {
		$this->setView('ajax');
		$this->handleChangeStatusPage($id, $status);
	}

	public function handleChangeStatusPage($id, $status) {
		$this->flashMessage('Satatus changed to '.$status.'. (not really)', 'alert-success');
		$this->redrawControl();
	}

	public function handleUnactivePageSelected() {
		$this->flashMessage('Satatus in selected changed. (not really)', 'alert-success');
		$this->redrawControl();
	}

	public function handleActivePageSelected() {
		$this->flashMessage('Satatus in selected changed. (not really)', 'alert-success');
		$this->redrawControl();
	}
}
