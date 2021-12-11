using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities
{
    public class Request
    {
        private String requestId;
        private String requestFirstName;
        private String requestLastName;
        private String requestAccessNetId;
        private String requestEmail;
        private String requestPhoneNumber;
        private String requestAssetName;
        private String requestTimeOfRequest;
        private String requestStatus;
        private String requestComment;

        public String RequestID
        {
            get { return requestId; }
            set { requestId = value; }
        }

        public String RequestFirstName
        {
            get { return requestFirstName; }
            set { requestFirstName = value; }
        }

        public String RequestLastName
        {
            get { return requestLastName; }
            set { requestLastName = value; }
        }

        public String RequestAccessNetId
        {
            get { return requestAccessNetId; }
            set { requestAccessNetId = value; }
        }

        public String RequestEmail
        {
            get { return requestEmail; }
            set { requestEmail = value; }
        }

        public String RequestPhoneNumber
        {
            get { return requestPhoneNumber; }
            set { requestPhoneNumber = value; }
        }

        public String RequestAssetName
        {
            get { return requestAssetName; }
            set { requestAssetName = value; }
        }

        public String RequestTimeOfRequest
        {
            get { return requestTimeOfRequest; }
            set { requestTimeOfRequest = value; }
        }

        public String RequestStatus
        {
            get { return requestStatus; }
            set { requestStatus = value; }
        }

        public String RequestComment
        {
            get { return requestComment; }
            set { requestComment = value; }
        }

    }
}
