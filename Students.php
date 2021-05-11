<?php

class StudentsCore extends ObjectModel
{

    public $id;
    public $name;
    public $date;
    public $status;
    public $average_score;

    public static $definition = [
        'table' => 'students',
        'primary' => 'id',
        'multilang' => true,
        'fields' => [
            'name' => ['type' => self::TYPE_STRING, 'lang' => true, 'validate' => 'isGenericName'],
            'date' => ['type' => self::TYPE_DATE, 'validate' => 'isDate'],
            'status' => ['type' => self::TYPE_INT],
            'average_score' => ['type' => self::TYPE_FLOAT],
        ],
    ];

    public static function getAllStudents()
    {
        $idLang = (int) Configuration::get('PS_LANG_DEFAULT');
        $sql = new DbQuery();
        $sql->select('*')
            ->from('students', 's')
            ->leftJoin('students_lang', 'sl', 's.id = sl.id_student')
            ->where('sl.id_lang = '.$idLang);
        return Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);
    }

    public static function getBestStudent()
    {
        $idLang = (int) Configuration::get('PS_LANG_DEFAULT');
        $sql = new DbQuery();
        $sql->select('name')
            ->from('students', 's')
            ->leftJoin('students_lang', 'sl', 's.id = sl.id_student')
            ->where('sl.id_lang = '.$idLang.' AND s.average_score = (SELECT MAX(average_score) from ' . _DB_PREFIX_ . 'students)');
        return Db::getInstance(_PS_USE_SQL_SLAVE_)->getRow($sql);
    }

    public static function getTopScore()
    {
        $sql = new DbQuery();
        $sql->select('average_score')->from('students')->where('average_score = (SELECT MAX(average_score) from ' . _DB_PREFIX_ . 'students)');
        return Db::getInstance(_PS_USE_SQL_SLAVE_)->getRow($sql);
    }
}
