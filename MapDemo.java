import java.util.*;
class Employee
{
	String name;
	String dept;
	int sal;

	Employee(String name,String dept,int sal)
	{
		this.name=name;
		this.dept=dept;
		this.sal=sal;
	}

	public String toString()
	{
		return name+".."+dept+".."+sal;
	}
}


class MapDemo
{
	public static void main(String[] args) {
		Employee e1=new Employee("milan","Account",35000);
		Employee e2=new Employee("Subha","Research",66000);
		Employee e3=new Employee("Sid","Marketing",45000);
		Employee e4=new Employee("Dibya","Clerk",28000);
		Employee e5=new Employee("Biswa","Developer",40000);
		HashMap m=new HashMap();
		m.put(101,e1);
		m.put(102,e2);
		m.put(103,e3);
		m.put(104,e4);
		m.put(105,e5);
		System.out.println(m.get(101));
		System.out.println(m);
		Set s1=m.keySet();
		System.out.println(s1);
		System.out.println(m.entrySet());


		Iterator itr=s1.iterator();
		while(itr.hasNext())
		{
			Map.Entry m1=(Map.Entry)itr.next();
			System.out.println(m1.getKey()+"....."+m1.getValue());
		}
	}
}