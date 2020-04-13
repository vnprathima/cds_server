exports.priorAuthRule = function(patient,code){
    if (code === "A0425"){
        return false;
    } else {
        return true;
    }
}