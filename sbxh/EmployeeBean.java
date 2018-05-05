/**
* The Entity bean for Employee
* @ejb:bean name="Employee"
*           display-name="Employee"
*           jndi-name= "ejb/Employee"
*           local-jndi-name="ejb/EmployeeLocal"
**/
public abstract class EmployeeBean implements EntityBean {

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
      
      /**
      * @ejb:persistent-field
      * @ejb:interface-method view-type="both"
      **/
      public abstract int getAge();
      /**
      * @ejb:interface-method view-type="both"
      **/
      public abstract void setAge(int age);
      
      /**
      * @ejb:persistent-field
      * @ejb:interface-method view-type="both"
      **/
      public abstract String getSection();
      /**
      * @ejb:interface-method view-type="both"
      **/
      public abstract void setSection(String section);
      
}
