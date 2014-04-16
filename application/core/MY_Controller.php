<?php if (!defined('BASEPATH')) die();

class MY_Controller extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
    }
}

#前台父控制器
class Home_Controller extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->switch_themes_on();
    }


}

#后台父控制器
class Admin_Controller extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->switch_themes_off();
    }


}