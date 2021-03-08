<?php
class Tracker extends Model
{

    public $table = 't_tracker';

    public function getListIP($dateCurent)
    {

        $listeIp = $this->find([
            'conditions' => ['date_connection' => $dateCurent],
            'fields' => 'ip_user'
        ]);
        return $listeIp;
    }

    public function Addip($dateCurent,$ipVisitor){

        $info=[
            'date_connection'=>$dateCurent,
            'ip_user'=>$ipVisitor
        ];

        $this->save($info);
    }
}
