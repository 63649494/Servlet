package cb;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class distId {
	public String distId(String id,DBOper db){
		Random ra =new Random();
		String sql = "SELECT clipId FROM clipboard WHERE clipId=?";
		ResultSet rs = db.executeQuery(sql, new String[]{id});
		try {
			if(rs.getString(1)!=null){
				int a=ra.nextInt(9999)+1;
				id=String.valueOf(a);
				distId(id,db);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}

}
