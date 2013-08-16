<?php

namespace Application\EservicesBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Environnement
 *
 * @ORM\Table(name="eservice_status")
 * @ORM\Entity
 */
class EserviceStatus
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=40, nullable=false)
     */
    private $nom;

     /**
     * @var string
     *
     * @ORM\Column(name="description", type="string", length=200, nullable=true)
     */
    private $description;
    
  /**
     * @ORM\OneToMany(targetEntity="Eservice", mappedBy="idStatus", cascade={"remove", "persist"}))
     */
    private $eservice;

    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set nomProjet
     *
     * @param string $nom
     * @return Environnement
     */
    public function setNom($nom)
    {
        $this->nom = $nom;
    
        return $this;
    }

     public function __toString() {
        return $this->getNom();    // this will not look good if SonataAdminBundle uses this ;)
    }

    /**
     * Get nomapplis
     *
     * @return string 
     */
    public function getNom()
    {
        return $this->nom;
    }

     /**
     * Set description
     *
     * @param string $description
     * @return Environnement
     */
    public function setDescription($description)
    {
        $this->description = $description;
    
        return $this;
    }

   

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
    }
    
    
    /**
     * Constructor
     */
    public function __construct()
    {
    }
    
   
  

    /**
     * Add eservice
     *
     * @param \Application\EservicesBundle\Entity\Eservice $eservice
     * @return EserviceStatus
     */
    public function addEservice(\Application\EservicesBundle\Entity\Eservice $eservice)
    {
        $this->eservice[] = $eservice;
    
        return $this;
    }

    /**
     * Remove eservice
     *
     * @param \Application\EservicesBundle\Entity\Eservice $eservice
     */
    public function removeEservice(\Application\EservicesBundle\Entity\Eservice $eservice)
    {
        $this->eservice->removeElement($eservice);
    }

    /**
     * Get eservice
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getEservice()
    {
        return $this->eservice;
    }
}