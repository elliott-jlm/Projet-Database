package classebdd;
import java.util.Scanner;

public class Test {

	public static void main(String[] args) {
		System.out.println("Bonjour, faites votre choix :"
				+ "\n\t1. Mode client\n\t2. Mode employé");
		boolean flag=true;
		String rep="";
		Scanner scan = new Scanner(System.in);
		while(flag) {
			rep=scan.nextLine();
			
			if(rep.equals("1")) { // MODE CLIENT
				System.out.println("\nOuverture du mode client ...");
				boolean flag_choix1 = true;
				String choix1="";
				while(flag_choix1) {
					System.out.println("1. recherche par marque\n2. Recherche par catégorie\n3. Retour");
					choix1=scan.nextLine();
					if(choix1.equals("1")) { // recherche par marque
						System.out.println("\nVoici les marques");
					}
					else if(choix1.equals("2")) { // recherche par catégorie
						System.out.println("\nVoici les catégories");
					}
					else if(choix1.equals("3")) { // retour
						flag_choix1=false;
						System.out.println("Bonjour, faites votre choix :"
								+ "\n\t1. Mode client\n\t2. Mode employé");
					}
					else { // Cas par défaut
						System.out.println("Erreur, rententez votre chance :");
					}
				}
			}
			else if(rep.equals("2")) {
				System.out.println("Ouverture du mode employé ...");
				
			}
			else {
				System.out.println("Entré incorrecte ... réessayez :\n");
			}
		}
	}

}
