<?php

namespace Application\EservicesBundle\Repository;

use Doctrine\ORM\EntityRepository;

/**
 * NotesRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class PersonRepository extends EntityRepository {
    public function myposition() {
        $myarr = array();
        $s_arr = array();
      
        $qb = $this->createQueryBuilder('a')
                ->select('a.id,a.lat,a.lng,a.address');
               

        foreach ($qb->getQuery()->getResult() as $d) {
         
    
            array_push($myarr, array($d['lng'],$d['lat'],$d['address']));
        }
        //  $myarr=array($s_arr);    
        //return ($myarr);
        //     print_r($myarr);
        return ($myarr);
        // print_r($myarr);
    }
   

}
