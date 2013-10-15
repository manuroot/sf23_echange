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

/*use Symfony\Component\Validator\Mapping\ClassMetadata;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;
use Doctrine\Common\Collections\ArrayCollection;*/



 
/**
 * Test\TestBundle\Entity\AbstractGMapEntity
 *
 * @author Sullivan SENECHAL
 *
 * @ORM\MappedSuperclass
 */
abstract class AbstractGMapEntity
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
     * @ORM\Column(name="address", type="string", length=255, nullable=true)
     */
    protected $address;
 
    /**
     * @var string
     *
     * @ORM\Column(name="locality", type="string", length=255, nullable=true)
     */
    protected $locality;
 
    /**
     * @var string
     *
     * @ORM\Column(name="country", type="string", length=255, nullable=true)
     */
    protected $country;
 
    /**
     * @var float     Latitude of the position
     *
     * @ORM\Column(name="lat", type="float", nullable=true)
     */
    protected $lat;
 
    /**
     * @var float     Longitude of the position
     *
     * @ORM\Column(name="lng", type="float", nullable=true)
     */
    protected $lng;
 
      public function getId() {
        return $this->id;
    }
    public function setAddress($address)
    {
        $this->address = $address;
    }
 
    public function getAddress()
    {
        return $this->address;
    }
 
    public function setLocality($locality)
    {
        $this->locality = $locality;
    }
 
    public function getLocality()
    {
        return $this->locality;
    }
 
    public function setCountry($country)
    {
        $this->country = $country;
    }
 
    public function getCountry()
    {
        return $this->country;
    }
 
    public function getLat()
    {
        return $this->lat;
    }
 
    public function setLat($lat)
    {
        if (is_string($lat)) {
            $lat = floatval($lat);
        }
        $this->lat = $lat;
    }
 
    public function getLng()
    {
        return $this->lng;
    }
 
    public function setLng($lng)
    {
        if (is_string($lng)) {
            $lng = floatval($lng);
        }
        $this->lng = $lng;
    }
}
?>