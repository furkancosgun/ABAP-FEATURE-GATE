sap.ui.define(
  ["sap/ui/base/ManagedObject", "sap/m/MessageBox"],
  function (ManagedObject, MessageBox) {
    "use strict";

    return ManagedObject.extend(
      "com.furkancosgun.zfeaturegate.handler.MessageHandler",
      {
        handleServiceError: function (oError) {
          try {
            const error = JSON.parse(oError.responseText).error;
            MessageBox.error(error.message.value, {
              details: error.innererror,
            });
          } catch (e) {
            MessageBox.error("An unknown error occurred.");
          }
        },
      }
    );
  }
);
