<?php
class Home extends Model
{
    public $table = 't_home';

  
    public function getHome(){

        $d =$this->findFirst([
            'conditions'=>['is_active'=>1]
        ]);

        return $d;
    }
   
    
}
