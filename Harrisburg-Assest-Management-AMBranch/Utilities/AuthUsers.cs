using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities
{
    public class AuthUsers
    {
        private String permittedUserID;
        private String permittedFirstName;
        private String permittedLastName;
        private String permittedAccessNetId;
        private String permittedTUiD;
        private String permittedEmail;

        public String PermittedUserID
        {
            get { return permittedUserID; }
            set { permittedUserID = value; }
        }

        public String PermittedFirstName
        {
            get { return permittedFirstName; }
            set { permittedFirstName = value; }
        }

        public String PermittedLastName
        {
            get { return permittedLastName; }
            set { permittedLastName = value; }
        }

        public String PermittedAccessNetId
        {
            get { return permittedAccessNetId; }
            set { permittedAccessNetId = value; }
        }

        public String PermittedTUiD
        {
            get { return permittedTUiD; }
            set { permittedTUiD = value; }
        }

        public String PermittedEmail
        {
            get { return permittedEmail; }
            set { permittedEmail = value; }
        }
    }
}
