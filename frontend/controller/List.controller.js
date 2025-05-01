sap.ui.define(
  [
    "sap/ui/core/mvc/Controller",
    "com/furkancosgun/zfeaturegate/handler/MessageHandler",
  ],
  function (Controller, MessageHandler) {
    "use strict";

    return Controller.extend("com.furkancosgun.zfeaturegate.controller.List", {
      _ACTIVE_PROPERTY: "IsActive",

      onInit: function () {
        this._messageHandler = new MessageHandler();
        this.getOwnerComponent()
          .getRouter()
          .attachRoutePatternMatched(this._onRoutePatternMatched, this);
      },
      _onRoutePatternMatched: function () {
        this._model = this.getView().getModel();
      },

      onSwitchChange: function (oEvent) {
        const oSwitchControl = oEvent.getSource();
        const bSwitchState = oEvent.getParameter("state");
        const oBindingContext = oSwitchControl.getBindingContext();

        this._updateFeatureStatus(oBindingContext, bSwitchState);
      },

      _updateFeatureStatus: function (oBindingContext, bNewStatus) {
        const sItemPath = oBindingContext.getPath();
        const oItemData = this._getItemData(sItemPath);

        oItemData[this._ACTIVE_PROPERTY] = bNewStatus;

        this._updateItem(sItemPath, oItemData);
      },

      _getItemData: function (itemPath) {
        return this._model.getObject(itemPath);
      },

      _updateItem: function (itemPath, itemData) {
        this._model.update(itemPath, itemData, {
          error: this._messageHandler.handleServiceError,
        });
      },
    });
  }
);
