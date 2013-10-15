<?php

/**
 * This file is part of the <name> project.
 *
 * (c) <yourname> <youremail>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Application\EservicesBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Application\EservicesBundle\Entity\AbstractGMapEntity;


/**
 * Person
 *
 * @author Sullivan SENECHAL
 *
 * @ORM\Table(name="person")
 */


/**
 * Changements
 *
 * @ORM\Table(name="person")
 * @ORM\Entity(repositoryClass="Application\EservicesBundle\Repository\PersonRepository")
 */


class Person extends AbstractGMapEntity
{
    /**
     * @var string
     *
     * @ORM\Column(name="first_name", type="string", length=255, nullable=false)
     */
    protected $firstName;
 
    /**
     * @var string
     *
     * @ORM\Column(name="last_name", type="string", length=255, nullable=false)
     */
    protected $lastName;
 
    // Vos autres attibuts et méthodes...
    
      public function setFirstName($firstname)
    {
        $this->firstName = $firstname;
    }
 
    public function getFirstName()
    {
        return $this->firstName;
    }
        public function setLastName($lastname)
    {
        $this->lastName = $lastname;
    }
 
    public function getLastName()
    {
        return $this->lastname;
    }
}
?>