<?php if (!defined('BASEPATH')) die();


class MY_Loader extends CI_Loader {

	protected $_themes = 'default/';

	public function switch_themes_on() {
		$this->_ci_view_paths = array(FCPATH . THEMES_DIR . $this->_themes => TRUE);

	} 

	public function switch_themes_off() {
		//just do nothing
	}
}