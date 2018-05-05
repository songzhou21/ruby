/**
* The Entity bean for Section
* @ejb:bean name="Section"
*           display-name="Section"
*           jndi-name= "ejb/Section"
*           local-jndi-name="ejb/SectionLocal"
**/
public abstract class SectionBean implements EntityBean {

      /**
      * @ejb:persistent-field
      * @ejb:interface-method view-type="both"
      **/
      public abstract String getName();
      /**
      * @ejb:interface-method view-type="both"
      **/
      public abstract void setName(String name);
      
      /**
      * @ejb:persistent-field
      * @ejb:interface-method view-type="both"
      **/
      public abstract int getId();
      /**
      * @ejb:interface-method view-type="both"
      **/
      public abstract void setId(int id);
      
}
