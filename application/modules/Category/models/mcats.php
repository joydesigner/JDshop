<?php
/**
 * Created by PhpStorm.
 * User: jzheng
 * Date: 17/04/14
 * Time: 3:22 PM
 */

class MCats extends CI_Model {
    public function __construct()
    {
        parent::__construct();
    }

    function getCategory($id){
        $data = array();
        $options = array('cat_id'=>$id);
        $Query = $this->db->getwhere('jd_category', $options,1);
        if($Query->num_rows()>0){
            $data = $Query->row_array();
        }

        $Query->free_result();
        return $data;
    }

    function getAllCategories(){
        $data = array();
        $Query = $this->db->get('jd_category');
        if($Query->num_rows()>0){
            foreach($Query->result_array() as $row){
                $data[] = $row;
            }
        }

        $Query->free_result();
        return $data;
    }
}