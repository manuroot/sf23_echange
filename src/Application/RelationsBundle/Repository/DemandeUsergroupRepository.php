<?php

namespace Application\RelationsBundle\Repository;

use Doctrine\ORM\EntityRepository;

/**
 * NotesRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class DemandeUsergroupRepository extends EntityRepository {

    public function myFindAll() {
        return $this->createQueryBuilder('a')
                        ->getQuery();

        //->getResult();
    }
  public function myFindAAll() {
        return $this->createQueryBuilder('a')
                        ->getQuery();

        //->getResult();
    }

    public function getMyPager(array $criteria) {

        $parameters = array();
        $query = $this->createQueryBuilder('a')
            //    ->select('a,b')
  ->select('a')             
//    ->leftJoin('a.idgroup', 'b')
                 ->add('orderBy', 'a.id DESC')
          ;
          if (isset($criteria['user'])) {
            //  print_r($criteria);exit(1);
            $query->andwhere('a.iduser = :user_id');
            $parameters['user_id'] = $criteria['user'];
        }


     if (isset($criteria['non-user'])) {
            //  print_r($criteria);exit(1);
            $query->andWhere('a.iduser <> :nonuser_id');
            $parameters['nonuser_id'] = $criteria['non-user'];
        }

          if (isset($criteria['parrain'])) {
            //  print_r($criteria);exit(1);
            $query->andWhere('a.iduserParrain <> :parrain');
            $parameters['parrain'] = $criteria['parrain'];
        }
        
        if (isset($criteria['group'])) {
         //   echo "here";exit(1);
            $query->andWhere('a.idgroup = :group_id');
            $parameters['group_id'] = $criteria['group'];
        }

     
        $query->setParameters($parameters);
        return $query->getQuery()->getResult();
      
    }
public function getCategoriesWeights($categories)
{
        //getPosts()
        $catWeights=array();
        $aa=array();
        foreach ($categories as $cat)
    {
         $a=$cat->getPosts();
         $b=count($a);
         $catWeights[$cat->getSlug()] =$b;
      }
     $max = max($catWeights);
    // Max of 5 weights
    $multiplier = ($max > 5) ? 5 / $max : 1;
    foreach ($catWeights as &$cat)
    {
        $cat = ceil($cat * $multiplier);
    }
    /*
print_r($catWeights);
exit(1);*/
  return $catWeights;
}



public function findPoids(){
   /*  $emConfig = $this->getEntityManager()->getConfiguration();
    $emConfig->addCustomDatetimeFunction('YEAR', 'DoctrineExtensions\Query\Mysql\Year');
    $emConfig->addCustomDatetimeFunction('MONTH', 'DoctrineExtensions\Query\Mysql\Month');
    $emConfig->addCustomDatetimeFunction('DAY', 'DoctrineExtensions\Query\Mysql\Day');
    */
  //  $year=2013;
      $qb = $this->createQueryBuilder('p');
    //$qb->select('COUNT(p)')
         //   $qb->select('p.id,p.publicationDateStart');
    //   ->where('YEAR(p.publicationDateStart) = :year');
  //  $qb->setParameter('year', $year);
   $arr=array();
  //  ->getSingleScalarResult();
//print_r($qb->getQuery()->getResult());
   // $arr["$year"]=0;
  
foreach ($qb->getQuery()->getResult() as $d){
    
   // echo $d['publicationDateStart']->format('Y-m-d H:i:s') . "<br>";
  //   echo $d['publicationDateStart']->format('Y') . "<br>";
      $year=$d['publicationDateStart']->format('Y');
        if (!(isset($arr["$year"]))) $arr["$year"]=0;
        $arr["$year"]=$arr["$year"]+1;
   
}
//print_r($arr);
//exit(1);
return ($arr);
//        return $query->getResult();

 }

}
