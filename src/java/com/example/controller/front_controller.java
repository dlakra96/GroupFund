package com.example.controller;

import com.example.entity.Bank_officer;
import com.example.entity.Branches;
import com.example.entity.Customer;
import com.example.entity.Products;
import com.example.entity.Service_desk;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.RollbackException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.eclipse.persistence.internal.jpa.rs.metadata.model.Link;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
@Controller
@SessionAttributes("ser")
public class front_controller {
    
   List <String> tickets_SA=new ArrayList<>();
   List <String> tickets_CA=new ArrayList<>();
   List <String> tickets_FD=new ArrayList<>();
   List <String> tickets_LO=new ArrayList<>();
   List <String> tickets_CC=new ArrayList<>();
   List <String> tickets_DC=new ArrayList<>();
   int count=1;
   @RequestMapping(value="/")
   public String returnHome()
   {
   return "index";    
   }
   
   @RequestMapping(value = "/admin")
    public String adminLogin(Model map)
    {
    EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
    EntityManager em=emf.createEntityManager();
    em.getTransaction().begin();
List<Bank_officer> ent=em.createQuery("select b from Bank_officer b").getResultList();
 List<Branches> entb=em.createQuery("select bb from Branches bb").getResultList();
List<Service_desk> sdl=em.createQuery("select bbb from Service_desk bbb").getResultList();
List<Products> pdl=em.createQuery("select bbl from Products bbl").getResultList();
map.addAttribute("l", ent);
map.addAttribute("lb",entb);
map.addAttribute("lbb",sdl);
map.addAttribute("lbbl",pdl);

em.getTransaction().commit();
    return "welcomeA";    
    }
@ModelAttribute(value="cust")
public Customer newCustomer()
{
    return new Customer();
}
@ModelAttribute(value="officer")
public Bank_officer newOfficer()
{
    
return new Bank_officer();
}
@ModelAttribute(value="branch")
public Branches newBranch()
{
return new Branches();
}
@ModelAttribute(value="desk")
public Service_desk newdesk()
{
return new Service_desk();
}
@ModelAttribute(value="product")
public Products newProduct()
{
return new Products();
}

    @RequestMapping(value="/bankofficer")
public String bankofficer_login(Model map)
{
    return "officer_login";
}
@RequestMapping(value = "/loginOfficer",method = RequestMethod.POST)
public String officer_login(@ModelAttribute("officer") Bank_officer officer,Model map)
{String ser=null;
 EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
 EntityManager em=emf.createEntityManager();
try{
 em.getTransaction().begin();
Bank_officer officer37=(Bank_officer) em.createNamedQuery("officer.find").setParameter("user_name", officer.getUsername()).setParameter("user_pass", officer.getPassword()).getSingleResult();
em.getTransaction().commit();
String sub=officer37.getId().substring(0, 2);
switch(sub)
{
    case "SA":
        ser="Savings Account";
        map.addAttribute("tickets_list",tickets_SA);
        break;
    case "FD":
        ser="Fixed Deposit";
        map.addAttribute("tickets_list",tickets_FD);
        break;
    case "CA":
        ser="Current Account";
        map.addAttribute("tickets_list",tickets_CA);
        break;
    case "LO":
        ser="Loan";
        map.addAttribute("tickets_list",tickets_LO);
        break;
    case "CC":
        ser="Credit Card";
        map.addAttribute("tickets_list",tickets_CC);
        break;
    case "DC":
        ser="Debit Card";
        map.addAttribute("tickets_list",tickets_DC);
        break;
        
    default:break;
}

map.addAttribute("u_name",officer.getUsername());
map.addAttribute("ser",ser);
return "success7";
}
catch(NoResultException ex)
{
    return "error";    
}
}
@RequestMapping(value="/customer_register")
public String customer_Register(Model map)
{
    return "form";
}
@RequestMapping(value="/addCustomer")
public String addCust(@ModelAttribute Customer cust,Map model)
{
    EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
    EntityManager em=emf.createEntityManager();
    em.getTransaction().begin();
    em.persist(cust);
    em.getTransaction().commit();
    model.put("msg", "Customer registered successfully!!!!!");
    return "success";
}
@RequestMapping(value="/customer_login")
public String customer_Login(Model map)
{
    
    return "loginCustomer";
}
@RequestMapping(value="/loginCustomer")
public String check_Customer(@ModelAttribute Customer cust,Map model)
{
    EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
    EntityManager em=emf.createEntityManager();
    em.getTransaction().begin();
List<Customer> result= em.createNamedQuery("customer.find").setParameter("custName", cust.getName()).setParameter("custPassword", cust.getPassword()).getResultList();
em.getTransaction().commit();
    
if(result.isEmpty())
{
return "error";
}
else
{
    model.put("msg","Customer successfully logged in!");
    return "success";
}
    
}
@RequestMapping(value="/ticket")
public String select_Ticket(Model map)
{
    
    return "genTicket";
}
@RequestMapping(value = "/Generate")
public String generate_Ticket(Model map,HttpServletRequest req)
{
    String service=(String) req.getParameter("serv");
    String tno=null;
    switch(service)
    {
        case "Fixed Deposit":
            tno="FD"+count;
            tickets_FD.add(tno);
            break;
        case "Saving Account":
            tno="SA"+count;
            tickets_SA.add(tno);
            break;
        case "Credit Card":
            tno="CC"+count;
            tickets_CC.add(tno);
            break;
        case "Debit Card":
            tno="DC"+count;
            tickets_DC.add(tno);
            break;
        case "Current Account":
            tno="CA"+count;
            tickets_CA.add(tno);
            break;
        case "Loan":
            tno="LO"+count;
            tickets_LO.add(tno);
            break;   
    }

count++;
map.addAttribute("tno", tno);
return "showTicket";
}
@RequestMapping(value="/login")
public String returnForm()
{
return "login";    
}
@RequestMapping(value="/admin/addBO",method = RequestMethod.GET)
public String DBform()
{
    return "bankO_register";
}
@RequestMapping(value="/admin/addBO",method = RequestMethod.POST)
public String newBO(@Valid @ModelAttribute("officer") Bank_officer officer,BindingResult bindingResult,Map model)
{if(bindingResult.hasErrors())
{
    return "bankO_register";
}
else
{
EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
EntityManager em=emf.createEntityManager();
em.getTransaction().begin();
em.persist(officer);
em.getTransaction().commit();
model.put("msg", "Officer added successfully!!!!!");
return "success";
}
}
@RequestMapping(value="/admin/delBO")
public String DBform_delete()
{
    return "bankO_delete";
}
@RequestMapping(value="/admin/deleteOfficer")
public String delete(@ModelAttribute("officer") Bank_officer officer,Map model)
{
    
    EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
    EntityManager em=emf.createEntityManager();
    em.getTransaction().begin();
    Bank_officer officer_f=em.find(Bank_officer.class, officer.getId());
    em.remove(officer_f);
    em.getTransaction().commit();
model.put("msg", "Officer Deleted Successfully..............");
return "success";
}
@RequestMapping(value="/admin/addBranch")
public String add_branch()
{    return "branch_register";
}
@RequestMapping(value="/admin/AddBranch")
public String new_branch(@ModelAttribute("branch") Branches branch,Model map)
{EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
EntityManager em=emf.createEntityManager();
em.getTransaction().begin();
em.persist(branch);
em.getTransaction().commit();
map.addAttribute("msg","Branch added successfully!!!!!!!");
return "success";
}
@RequestMapping(value="/admin/delBranch")
public String del_branch()
{
    return "branch_delete";
}
@RequestMapping(value = "/admin/DelBranch")
public String old_branch(@ModelAttribute("branch") Branches branch,Model map)
{EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
EntityManager em=emf.createEntityManager();
em.getTransaction().begin();
Query q=em.createQuery("delete from Service_desk sd where sd.b_code=:branchCode").setParameter("branchCode",branch.getCode());
q.executeUpdate();
em.getTransaction().commit();
em.getTransaction().begin();
Branches branch_rem=em.find(Branches.class, branch.getCode());
    em.remove(branch_rem);
    em.getTransaction().commit();
map.addAttribute("msg","Branch deleted successfully!!!!!!!");
    
return "success";
}
@RequestMapping(value="/admin/addServ")
public String add_desk()
{
return "desk_register";    
}
@RequestMapping(value = "/admin/AddServ")
public String Add_desk(@ModelAttribute("desk") Service_desk desk,Model map)
{EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
EntityManager em=emf.createEntityManager();
try{em.getTransaction().begin();
Branches bl=em.find(Branches.class, desk.getB_code());
em.getTransaction().commit();
desk.setBranches77(bl);
em.getTransaction().begin();
em.persist(desk);
em.getTransaction().commit();
map.addAttribute("msg","Service desk entered successfully!!!!!!");
}
catch(RollbackException ex)
{
    map.addAttribute("msg","Sorry !!!! No branch exists with the branch code entered by the user");
}
return "success";
}
@RequestMapping(value = "/admin/delServ")
public String del_Serv()
{
    return "desk_delete";
}
@RequestMapping(value = "/admin/DelServ")
public String Del_serv(@ModelAttribute("desk") Service_desk desk,Model map)
{EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
EntityManager em=emf.createEntityManager();
em.getTransaction().begin();
Service_desk desk7=em.find(Service_desk.class, desk.getNumber());
    em.remove(desk7);
    em.getTransaction().commit();
    map.addAttribute("msg","Service desk deleted successfully!!!!!");
    return "success";
}
@RequestMapping(value = "/admin/addProd")
public String add_Prod()
{
    
return "prod_register";
}
@RequestMapping(value = "/admin/AddProd")
public String Add_Prod(@ModelAttribute("product") Products product,Model map)
{EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
EntityManager em=emf.createEntityManager();
try{
em.getTransaction().begin();
em.persist(product);
em.getTransaction().commit();
map.addAttribute("msg","New Product/Service added successfully");
}
catch(RollbackException ex)
{
    map.addAttribute("msg","Product ID entered by user already exists");
}
return "success";
}
@RequestMapping(value = "/admin/delProd")
public String del_Prod()
{
    
return "prod_delete";
}
@RequestMapping(value = "/admin/DelProd")
public String Del_Prod(@ModelAttribute("product") Products product,Model map)
{EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
EntityManager em=emf.createEntityManager();
em.getTransaction().begin();
Products prod7=em.find(Products.class, product.getPid());
em.remove(prod7);
em.getTransaction().commit();
map.addAttribute("msg","Product/Service deleted successfully!!!!!!");
return "success";
}
@RequestMapping(value = "/admin/modifyBO",method=RequestMethod.GET)
public String get_form()
{
return "bankO_modify";

}
@RequestMapping(value = "/admin/modifyBO",method=RequestMethod.POST)
public String modify_BO( @ModelAttribute("officer") Bank_officer officer,BindingResult result,Model map,HttpServletRequest req)
{if (result.hasErrors())
{
    return "bankO_modify";
}
String[] options=req.getParameterValues("user_option");
String new_name,new_uname,new_pass;
EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
EntityManager em=emf.createEntityManager();
try{
em.getTransaction().begin();
Bank_officer officer_77=(Bank_officer) em.createQuery("select b from Bank_officer b where b.id=:uid").setParameter("uid", officer.getId()).getSingleResult();
em.getTransaction().commit();
new_name=officer_77.getName();
new_uname=officer_77.getUsername();
new_pass=officer_77.getPassword();
for(String i:options)
{
    switch (i) {
        case "user_name":
            new_name=officer.getName();
            break;
        case "user_uname":
            new_uname=officer.getUsername();
            break;
        case "user_pass":
            new_pass=officer.getPassword();
            break;
        default:
            break;
    }
}
    em.getTransaction().begin();
Query q=em.createQuery("update Bank_officer officer set officer.name=:n_name,officer.username=:n_uname,officer.password=:n_pass where officer.id=:n_id").setParameter("n_name",new_name).setParameter("n_uname", new_uname).setParameter("n_pass", new_pass).setParameter("n_id", officer.getId());
q.executeUpdate();
em.getTransaction().commit();
    map.addAttribute("msg", "Bank Officer modified successfully!!!");
return "success";
}

catch(NoResultException ex)
{
    map.addAttribute("msg", "No such record with this ID exists in the database");
    return "error";
}
}
@RequestMapping(value = "/admin/modifyBranch",method = RequestMethod.GET)
public String modify_Branch()
{
 return "branch_modify";   
}
@RequestMapping(value = "/admin/modifyBranch",method = RequestMethod.POST)
public String modify_Br(@ModelAttribute("branch") Branches branch,Model map)
{
    EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
    EntityManager em=emf.createEntityManager();
try{
    em.getTransaction().begin();
    Branches branch77=(Branches) em.createQuery("select b from Branches b where b.code=:bcode").setParameter("bcode", branch.getCode()).getSingleResult();
            em.getTransaction().commit();
} 
catch(NoResultException ex)
{
    map.addAttribute("msg", "No such branch with this code exists in the database!!!!!!");
    return "error";

}
em.getTransaction().begin();
Query q=em.createQuery("update Branches bran set bran.location=:new_loc where bran.code=:user_code").setParameter("new_loc", branch.getLocation()).setParameter("user_code", branch.getCode());
q.executeUpdate();
em.getTransaction().commit();
 map.addAttribute("msg","Branch modified successfully");
    return "success";

    }
@RequestMapping(value = "/admin/modifyProduct",method = RequestMethod.GET)
public String modify_Product()
{
    return "product_modify";
}
@RequestMapping(value="/admin/modifyProduct",method = RequestMethod.POST)
public String modify_P(@ModelAttribute("product") Products product,Model map,HttpServletRequest req)
{String[] options=req.getParameterValues("user_option");
String new_name,new_desc;
    EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
    EntityManager em=emf.createEntityManager();
    try{em.getTransaction().begin();
    Products product77=(Products) em.createQuery("select p from Products p where p.pid=:new_id").setParameter("new_id", product.getPid()).getSingleResult();
    em.getTransaction().commit();
new_name=product77.getPname();
new_desc=product77.getDescription();
for(String i:options)
{
    switch (i) {
        case "prod_name":
            new_name=product.getPname();
            break;
        case "prod_desc":
            new_desc=product.getDescription();
            break;
        default:
            break;
    }
}
   
em.getTransaction().begin();
Query q=em.createQuery("update Products prod set prod.pname=:n_name,prod.description=:n_desc where prod.pid=:n_id").setParameter("n_name",new_name).setParameter("n_desc", new_desc).setParameter("n_id",product.getPid());
q.executeUpdate();
    em.getTransaction().commit();
    map.addAttribute("msg","Product/Service modified successfully");
    return "success";
    }
    catch(NoResultException ex)
    {
    map.addAttribute("msg", "No such Product/Service with this id exists in the database!!!!!!");
    return "error";
   }
}
@RequestMapping(value = "/admin/modifyDesk",method = RequestMethod.GET)
public String modify_Desk()
{
return "desk_modify";    
}
@RequestMapping(value = "/admin/modifyDesk",method = RequestMethod.POST)
public String modify_D(@ModelAttribute("desk") Service_desk desk,Model map,HttpServletRequest req)
{
    String[] options=req.getParameterValues("user_option");
String new_bcode,new_active;
EntityManagerFactory emf=Persistence.createEntityManagerFactory("NiitProjectPU");
EntityManager em=emf.createEntityManager();
try{em.getTransaction().begin();
Service_desk desk77=(Service_desk) em.createQuery("select sd from Service_desk sd where sd.number=:desk_num").setParameter("desk_num", desk.getNumber()).getSingleResult();
em.getTransaction().commit();
new_bcode=desk77.getB_code();
new_active=desk77.getIsactive();
for(String i:options)
{
    switch(i)
    {
        case "branch_code":
            new_bcode=desk.getB_code();
            Branches branch12=em.find(Branches.class, new_bcode);
            break;
        case "desk_active":
            new_active=desk.getIsactive();
            break;
        default:break;
    }
}
em.getTransaction().begin();
Query q=em.createQuery("update Service_desk sd set sd.b_code=:n_code,sd.isactive=:n_active where sd.number=:n_num").setParameter("n_code", new_bcode).setParameter("n_active", new_active).setParameter("n_num", desk.getNumber());
q.executeUpdate();
em.getTransaction().commit();
map.addAttribute("msg","Service desk modified successfully");
return "success";
}
catch(NoResultException ex)
{
    map.addAttribute("msg","No such Service Desk exists with the desk-number entered by the user");
    return "error";
}
catch(RollbackException exp)
{
map.addAttribute("msg","No branch exists with the branch code entered by the user");
    return "error";    
}
}
@RequestMapping(value = "/increment")
public String inc(HttpServletRequest req,Model map)
{
String serv=req.getParameter("serv");
String user=req.getParameter("uname");
switch(serv)
{
    case "Fixed Deposit":
        tickets_FD.remove(0);
        map.addAttribute("tickets_list",tickets_FD);
        break;
    case "Savings Account":
        tickets_SA.remove(0);
        map.addAttribute("tickets_list",tickets_SA);
        break;
    case "Current Account":
        tickets_CA.remove(0);
        map.addAttribute("tickets_list",tickets_CA);
        break;
    case "Debit Card":
        tickets_DC.remove(0);
        map.addAttribute("tickets_list",tickets_DC);
        break;
    case "Credit Card":
        tickets_CC.remove(0);
        map.addAttribute("tickets_list",tickets_CC);
        break;
    case "Loan":
        tickets_LO.remove(0);
        map.addAttribute("tickets_list",tickets_LO);
        break;
    default:break;
}
        map.addAttribute("ser",serv);
    map.addAttribute("u_name",user);
        return "success7";
}
@RequestMapping(value = "/centralDisp")
public String central_Disp(Model map)
{
map.addAttribute("listSA",tickets_SA);
map.addAttribute("listFD",tickets_FD);
map.addAttribute("listCC",tickets_CC);
map.addAttribute("listDC",tickets_DC);
map.addAttribute("listLO",tickets_LO);
map.addAttribute("listCA",tickets_CA);
return "central_display";
}
}