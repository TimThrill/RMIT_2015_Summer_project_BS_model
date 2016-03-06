//
// Generated file, do not edit! Created by nedtool 4.6 from Beacon.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "Beacon_m.h"

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

Register_Class(Beacon);

Beacon::Beacon(const char *name, int kind) : ::ApplPkt(name,kind)
{
    //take(&(this->srcPosition_var));
    this->timeStamp_var = 0;
    this->srcNetworkAddress_var = 0;
}

Beacon::Beacon(const Beacon& other) : ::ApplPkt(other)
{
    //take(&(this->srcPosition_var));
    copy(other);
}

Beacon::~Beacon()
{
    //drop(&(this->srcPosition_var));
}

Beacon& Beacon::operator=(const Beacon& other)
{
    if (this==&other) return *this;
    ::ApplPkt::operator=(other);
    copy(other);
    return *this;
}

void Beacon::copy(const Beacon& other)
{
    this->srcPosition_var = other.srcPosition_var;
    //this->srcPosition_var.setName(other.srcPosition_var.getName());
    this->timeStamp_var = other.timeStamp_var;
    this->srcNetworkAddress_var = other.srcNetworkAddress_var;
}

void Beacon::parsimPack(cCommBuffer *b)
{
    ::ApplPkt::parsimPack(b);
    doPacking(b,this->srcPosition_var);
    doPacking(b,this->timeStamp_var);
    doPacking(b,this->srcNetworkAddress_var);
}

void Beacon::parsimUnpack(cCommBuffer *b)
{
    ::ApplPkt::parsimUnpack(b);
    doUnpacking(b,this->srcPosition_var);
    doUnpacking(b,this->timeStamp_var);
    doUnpacking(b,this->srcNetworkAddress_var);
}

Coord& Beacon::getSrcPosition()
{
    return srcPosition_var;
}

void Beacon::setSrcPosition(const Coord& srcPosition)
{
    this->srcPosition_var = srcPosition;
}

simtime_t Beacon::getTimeStamp() const
{
    return timeStamp_var;
}

void Beacon::setTimeStamp(simtime_t timeStamp)
{
    this->timeStamp_var = timeStamp;
}

uint32_t Beacon::getSrcNetworkAddress() const
{
    return srcNetworkAddress_var;
}

void Beacon::setSrcNetworkAddress(uint32_t srcNetworkAddress)
{
    this->srcNetworkAddress_var = srcNetworkAddress;
}

class BeaconDescriptor : public cClassDescriptor
{
  public:
    BeaconDescriptor();
    virtual ~BeaconDescriptor();

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

Register_ClassDescriptor(BeaconDescriptor);

BeaconDescriptor::BeaconDescriptor() : cClassDescriptor("Beacon", "ApplPkt")
{
}

BeaconDescriptor::~BeaconDescriptor()
{
}

bool BeaconDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<Beacon *>(obj)!=NULL;
}

const char *BeaconDescriptor::getProperty(const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int BeaconDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 3+basedesc->getFieldCount(object) : 3;
}

unsigned int BeaconDescriptor::getFieldTypeFlags(void *object, int field) const
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
    };
    return (field>=0 && field<3) ? fieldTypeFlags[field] : 0;
}

const char *BeaconDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "srcPosition",
        "timeStamp",
        "srcNetworkAddress",
    };
    return (field>=0 && field<3) ? fieldNames[field] : NULL;
}

int BeaconDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='s' && strcmp(fieldName, "srcPosition")==0) return base+0;
    if (fieldName[0]=='t' && strcmp(fieldName, "timeStamp")==0) return base+1;
    if (fieldName[0]=='s' && strcmp(fieldName, "srcNetworkAddress")==0) return base+2;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *BeaconDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "Coord",
        "simtime_t",
        "uint32_t",
    };
    return (field>=0 && field<3) ? fieldTypeStrings[field] : NULL;
}

const char *BeaconDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
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

int BeaconDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    Beacon *pp = (Beacon *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string BeaconDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    Beacon *pp = (Beacon *)object; (void)pp;
    switch (field) {
        case 0: {std::stringstream out; out << pp->getSrcPosition(); return out.str();}
        case 1: return double2string(pp->getTimeStamp());
        case 2: return ulong2string(pp->getSrcNetworkAddress());
        default: return "";
    }
}

bool BeaconDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    Beacon *pp = (Beacon *)object; (void)pp;
    switch (field) {
        case 1: pp->setTimeStamp(string2double(value)); return true;
        case 2: pp->setSrcNetworkAddress(string2ulong(value)); return true;
        default: return false;
    }
}

const char *BeaconDescriptor::getFieldStructName(void *object, int field) const
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

void *BeaconDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    Beacon *pp = (Beacon *)object; (void)pp;
    switch (field) {
        case 0: return (void *)static_cast<cObject *>(&pp->getSrcPosition()); break;
        default: return NULL;
    }
}


