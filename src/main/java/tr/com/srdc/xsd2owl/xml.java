package tr.com.srdc.xsd2owl;

import java.io.File;
import java.io.FileOutputStream;

public class xml {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// This part converts XML schema to OWL ontology.
		XSD2OWLMapper mapping = new XSD2OWLMapper(new File("src/test/resources/gtfs_1/AGENCY.xsd"));
		mapping.setObjectPropPrefix("");
		mapping.setDataTypePropPrefix("");
		mapping.convertXSD2OWL();

		// This part converts XML instance to RDF data model.
		XML2OWLMapper generator = new XML2OWLMapper(
				new File("src/test/resources/gtfs_1/AGENCY.xml"), mapping);
		generator.convertXML2OWL();

		// This part prints the RDF data model to the specified file.
		try{
			File f = new File("src/test/resources/output/agency3.rdf");
			f.getParentFile().mkdirs();
			FileOutputStream fout = new FileOutputStream(f);
			generator.writeModel(fout, "RDF/XML");
			fout.close();

		} catch (Exception e){
			e.printStackTrace();
		}
	}


}
