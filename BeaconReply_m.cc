//
// Generated file, do not edit! Created by nedtool 4.6 from BeaconReply.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "BeaconReply_m.h"

USING_NAMESPACE


// Another default rule (prevents compiler from choosing base class' doPacking())
template<typename T>
void doPacking(cCommBuffer *, T& t) {
    throw cRuntimeError("Parsim error: no doPacking() function for type %s or its base class (check .msg and _m.cc/h files!)",opp_typename(typeid(t)));
}

template<typename T>
void doUnpacking(cCommBuffer *, T& t) {
    throw cRuntimeError("Parsim error: no doUnpacking() function for type %s or its base class (check .msg and _m.cc/h files!)",opp_typename(typeid(t)));
}




// Template rule for outputting std::vector<T> types
template<typename T, typename A>
inline std::ostream& operator<<(std::ostream& out, const std::vector<T,A>& vec)
{
    out.put('{');
    for(typename std::vector<T,A>::const_iterator it = vec.begin(); it != vec.end(); ++it)
    {
        if (it != vec.begin()) {
            out.put(','); out.put(' ');
        }
        out << *it;
    }
    out.put('}');
    
    char buf[32];
    sprintf(buf, " (size=%u)", (unsigned int)vec.size());
    out.write(buf, strlen(buf));
    return out;
}

// Template rule which fires if a struct or class doesn't have operator<<
template<typename T>
inline std::ostream& operator<<(std::ostream& out,const T&) {return out;}

Register_Class(BeaconReply);

BeaconReply::BeaconReply(const char *name, int kind) : ::ApplPkt(name,kind)
{
    //take(&(this->peerLocation_var));
    this->peerDistance_var = 0;
    this->timeStamp_var = 0;
    this->srcNetworkAddress_var = 0;
}

BeaconReply::BeaconReply(const BeaconReply& other) : ::ApplPkt(other)
{
    //take(&(this->peerLocation_var));
    copy(other);
}

BeaconReply::~BeaconReply()
{
    //drop(&(this->peerLocation_var));
}

BeaconReply& BeaconReply::operator=(const BeaconReply& other)
{
    if (this==&other) return *this;
    ::ApplPkt::operator=(other);
    copy(other);
    return *this;
}

void BeaconReply::copy(const BeaconReply& other)
{
    this->peerLocation_var = other.peerLocation_var;
    //this->peerLocation_var.setName(other.peerLocation_var.getName());
    this->peerDistance_var = other.peerDistance_var;
    this->timeStamp_var = other.timeStamp_var;
    this->srcNetworkAddress_var = other.srcNetworkAddress_var;
}

void BeaconReply::parsimPack(cCommBuffer *b)
{
    ::ApplPkt::parsimPack(b);
    doPacking(b,this->peerLocation_var);
    doPacking(b,this->peerDistance_var);
    doPacking(b,this->timeStamp_var);
    doPacking(b,this->srcNetworkAddress_var);
}

void BeaconReply::parsimUnpack(cCommBuffer *b)
{
    ::ApplPkt::parsimUnpack(b);
    doUnpacking(b,this->peerLocation_var);
    doUnpacking(b,this->peerDistance_var);
    doUnpacking(b,this->timeStamp_var);
    doUnpacking(b,this->srcNetworkAddress_var);
}

Coord& BeaconReply::getPeerLocation()
{
    return peerLocation_var;
}

void BeaconReply::setPeerLocation(const Coord& peerLocation)
{
    this->peerLocation_var = peerLocation;
}

double BeaconReply::getPeerDistance() const
{
    return peerDistance_var;
}

void BeaconReply::setPeerDistance(double peerDistance)
{
    this->peerDistance_var = peerDistance;
}

simtime_t BeaconReply::getTimeStamp() const
{
    return timeStamp_var;
}

void BeaconReply::setTimeStamp(simtime_t timeStamp)
{
    this->timeStamp_var = timeStamp;
}

uint32_t BeaconReply::getSrcNetworkAddress() const
{
    return srcNetworkAddress_var;
}

void BeaconReply::setSrcNetworkAddress(uint32_t srcNetworkAddress)
{
    this->srcNetworkAddress_var = srcNetworkAddress;
}

class BeaconReplyDescriptor : public cClassDescriptor
{
  public:
    BeaconReplyDescriptor();
    virtual ~BeaconReplyDescriptor();

    virtual bool doesSupport(cObject *obj) const;
    virtual const char *getProperty(const char *propertyname) const;
    virtual int getFieldCount(void *object) const;
    virtual const char *getFieldName(void *object, int field) const;
    virtual int findField(void *object, const char *fieldName) const;
    virtual unsigned int getFieldTypeFlags(void *object, int field) const;
    virtual const char *getFieldTypeString(void *object, int field) const;
    virtual const char *getFieldProperty(void *object, int field, const char *propertyname) const;
    virtual int getArraySize(void *object, int field) const;

    virtual std::string getFieldAsString(void *object, int field, int i) const;
    virtual bool setFieldAsString(void *object, int field, int i, const char *value) const;

    virtual const char *getFieldStructName(void *object, int field) const;
    virtual void *getFieldStructPointer(void *object, int field, int i) const;
};

Register_ClassDescriptor(BeaconReplyDescriptor);

BeaconReplyDescriptor::BeaconReplyDescriptor() : cClassDescriptor("BeaconReply", "ApplPkt")
{
}

BeaconReplyDescriptor::~BeaconReplyDescriptor()
{
}

bool BeaconReplyDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<BeaconReply *>(obj)!=NULL;
}

const char *BeaconReplyDescriptor::getProperty(const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int BeaconReplyDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 4+basedesc->getFieldCount(object) : 4;
}

unsigned int BeaconReplyDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISCOMPOUND | FD_ISCOBJECT | FD_ISCOWNEDOBJECT,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
    };
    return (field>=0 && field<4) ? fieldTypeFlags[field] : 0;
}

const char *BeaconReplyDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "peerLocation",
        "peerDistance",
        "timeStamp",
        "srcNetworkAddress",
    };
    return (field>=0 && field<4) ? fieldNames[field] : NULL;
}

int BeaconReplyDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='p' && strcmp(fieldName, "peerLocation")==0) return base+0;
    if (fieldName[0]=='p' && strcmp(fieldName, "peerDistance")==0) return base+1;
    if (fieldName[0]=='t' && strcmp(fieldName, "timeStamp")==0) return base+2;
    if (fieldName[0]=='s' && strcmp(fieldName, "srcNetworkAddress")==0) return base+3;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *BeaconReplyDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "Coord",
        "double",
        "simtime_t",
        "uint32_t",
    };
    return (field>=0 && field<4) ? fieldTypeStrings[field] : NULL;
}

const char *BeaconReplyDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldProperty(object, field, propertyname);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        default: return NULL;
    }
}

int BeaconReplyDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    BeaconReply *pp = (BeaconReply *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string BeaconReplyDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    BeaconReply *pp = (BeaconReply *)object; (void)pp;
    switch (field) {
        case 0: {std::stringstream out; out << pp->getPeerLocation(); return out.str();}
        case 1: return double2string(pp->getPeerDistance());
        case 2: return double2string(pp->getTimeStamp());
        case 3: return ulong2string(pp->getSrcNetworkAddress());
        default: return "";
    }
}

bool BeaconReplyDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    BeaconReply *pp = (BeaconReply *)object; (void)pp;
    switch (field) {
        case 1: pp->setPeerDistance(string2double(value)); return true;
        case 2: pp->setTimeStamp(string2double(value)); return true;
        case 3: pp->setSrcNetworkAddress(string2ulong(value)); return true;
        default: return false;
    }
}

const char *BeaconReplyDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        case 0: return opp_typename(typeid(Coord));
        default: return NULL;
    };
}

void *BeaconReplyDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    BeaconReply *pp = (BeaconReply *)object; (void)pp;
    switch (field) {
        case 0: return (void *)static_cast<cObject *>(&pp->getPeerLocation()); break;
        default: return NULL;
    }
}


