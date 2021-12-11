using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities
{
    public class Asset
    {
        private String assetId;
        private String assetName;
        private String assetCategory;
        private String assetYear;
        private String assetBarcode;
        private String assetStatus;
        private String assetBorrower;
        private String assetCondition;

        public String AssetID
        {
            get { return assetId; }
            set { assetId = value; }
        }

        public String AssetName
        {
            get { return assetName; }
            set { assetName = value; }
        }

        public String AssetCategory
        {
            get { return assetCategory; }
            set { assetCategory = value; }
        }

        public String AssetYear
        {
            get { return assetYear; }
            set { assetYear = value; }
        }

        public String AssetBarcode
        {
            get { return assetBarcode; }
            set { assetBarcode = value; }
        }

        public String AssetStatus
        {
            get { return assetStatus; }
            set { assetStatus = value; }
        }

        public String AssetBorrower
        {
            get { return assetBorrower; }
            set { assetBorrower = value; }
        }

        public String AssetCondition
        {
            get { return assetCondition; }
            set { assetCondition = value; }
        }

    }
}
