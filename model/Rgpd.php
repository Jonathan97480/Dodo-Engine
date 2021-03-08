<?php
class Rgpd extends Model
{
    public $table = 't_rgpd';

    public function saveRgpd($description)
    {

        $this->primaryKey = 'name';
        $this->save([
            'name' => 'rgpd',
            'description' => $description
        ]);
    }
    public function saveLegalNotive($description)
    {

        $this->primaryKey = 'name';
        $this->save([
            'name' => 'legal_notive',
            'description' => $description
        ]);
    }

    public function getTextRgpd()
    {

        $info = $this->findFirst([
            'conditions' => ['name' => 'rgpd']
        ]);

        return $info;
    }
    public function getTextLegalNotive()
    {
        $info = $this->findFirst([
            'conditions' => ['name' => 'legal_notive']
        ]);

        return $info;
    }
    public function loadInfoRgpd()
    {
        $info = [];
        $d = $this->find([]);

        foreach ($d as $key => $value) {
            $info[$value->name] = $value;
        }

        return $info;
    }
}
