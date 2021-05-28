package classebdd;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class vehicule {

		private int id;
		private String immatriculation;
		private String marque;
		private String modele;
		private int km;
		private String carburant;
		private String clim;
		private String automatique;
		private String imgascii; // dans le cas ou on aurait une image acsii de chaque modèle pour potentiellemnt afficher l'image.
		
		public vehicule(File fichier) throws FileNotFoundException { // mettre la requete
			/*this.id=id;
			this.immatriculation=imat;
			this.marque=ma;
			this.modele=mod;
			this.km=km;
			this.carburant=car;
			this.automatique=auto;*/
			
			Scanner lecteur = new Scanner(fichier);
			this.imgascii="";
			while(lecteur.hasNextLine()) {
				this.imgascii+=lecteur.nextLine()+"\n";
			}
		}
		
		/*flag_menu=false;
		File ca = new File("C:\\Users\\Elliott Joliman\\Desktop\\EFREI\\L3_NEW\\S6\\UE_Informatique_applications\\Databases\\Projet\\modeles_voiture\\Mercedes\\classeA.txt");
		vehicule test= new vehicule(ca);
		System.out.println(test.getImgascii());*/

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getImmatriculation() {
			return immatriculation;
		}

		public void setImmatriculation(String immatriculation) {
			this.immatriculation = immatriculation;
		}

		public String getMarque() {
			return marque;
		}

		public void setMarque(String marque) {
			this.marque = marque;
		}

		public String getModele() {
			return modele;
		}

		public void setModele(String modele) {
			this.modele = modele;
		}

		public int getKm() {
			return km;
		}

		public void setKm(int km) {
			this.km = km;
		}

		public String getCarburant() {
			return carburant;
		}

		public void setCarburant(String carburant) {
			this.carburant = carburant;
		}

		public String getClim() {
			return clim;
		}

		public void setClim(String clim) {
			this.clim = clim;
		}

		public String getAutomatique() {
			return automatique;
		}

		public void setAutomatique(String automatique) {
			this.automatique = automatique;
		}

		public String getImgascii() {
			return imgascii;
		}

		public void setImgascii(String imgascii) {
			this.imgascii = imgascii;
		}

}
