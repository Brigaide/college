import java.util.HashMap;


public class StudentDatabase {

    private HashMap <Integer, Student> Students = new HashMap<Integer, Student>();

    public boolean addStudent(int studentID, Student student){
        if (Students.containsKey(studentID)){
            return false;
        }
        else{
            Students.put(studentID, student);
            return true;
        }
    }

    public String getStudentName(int studentID){
        if (Students.containsKey(studentID)){
            Student temp = Students.get(studentID);
            String name = temp.getFirstName() + " " + temp.getLastName();
            return name;
        } else {
            return null;
        }
    }

    public boolean removeStudent(int studentID){
        if (Students.containsKey(studentID)){
            Students.remove(studentID);
            return true;
        } else {
            return false;
        }
    }
    public String toString(){
        String newstring1 = "";
        for(Integer key : Students.keySet()){
            newstring1 += key.toString() + ":" + Students.get(key).toString() + "\n";
        }
        return newstring1;

    }

    public HashMap<Character, Integer> getLetterFrequency(int studentID){
        HashMap<Character, Integer> characterMap = new HashMap<Character, Integer>();
        String tempName = this.getStudentName(studentID);
        char[] letters = tempName.toCharArray();
        for (int i = 0; i < letters.length; i++) {
            if (characterMap.containsKey(letters[i])){
                int value = characterMap.get(letters[i]);
                characterMap.put(letters[i],  value + 1);
            } else {
                characterMap.put(letters[i], 1);
            }

        }
        return characterMap;

    }

    public static void main(String[] args){
        StudentDatabase newbase = new StudentDatabase();

        Student student1 = new Student("addlolpol", "poooop");
        Student student2 = new Student("Luke", "Luke");
        Student student3 = new Student("im", "tired");
        newbase.addStudent(4444, student1);
        newbase.addStudent(4443, student2);
        newbase.addStudent(4441, student3);
        System.out.print(newbase.toString());
        HashMap<Character, Integer> letters = newbase.getLetterFrequency(4444);
        System.out.println(letters);


    }
}
