//
// Generated file, do not edit! Created by nedtool 4.6 from Query.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "Query_m.h"

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

Register_Class(Query);

Query::Query(const char *name, int kind) : ::ApplPkt(name,kind)
{
    this->businessName_var = 0;
    this->businessType_var = 0;
    //take(&(this->peerLocation_var));
    this->maxRange_var = 0;
    this->timeStamp_var = 0;
}

Query::Query(const Query& other) : ::ApplPkt(other)
{
    //take(&(this->peerLocation_var));
    copy(other);
}

Query::~Query()
{
    //drop(&(this->peerLocation_var));
}

Query& Query::operator=(const Query& other)
{
    if (this==&other) return *this;
    ::ApplPkt::operator=(other);
    copy(other);
    return *this;
}

void Query::copy(const Query& other)
{
    this->businessName_var = other.businessName_var;
    this->businessType_var = other.businessType_var;
    this->keyWords_var = other.keyWords_var;
    this->peerLocation_var = other.peerLocation_var;
    //this->peerLocation_var.setName(other.peerLocation_var.getName());
    this->maxRange_var = other.maxRange_var;
    this->timeStamp_var = other.timeStamp_var;
}

void Query::parsimPack(cCommBuffer *b)
{
    ::ApplPkt::parsimPack(b);
    doPacking(b,this->businessName_var);
    doPacking(b,this->businessType_var);
    doPacking(b,this->keyWords_var);
    doPacking(b,this->peerLocation_var);
    doPacking(b,this->maxRange_var);
    doPacking(b,this->timeStamp_var);
}

void Query::parsimUnpack(cCommBuffer *b)
{
    ::ApplPkt::parsimUnpack(b);
    doUnpacking(b,this->businessName_var);
    doUnpacking(b,this->businessType_var);
    doUnpacking(b,this->keyWords_var);
    doUnpacking(b,this->peerLocation_var);
    doUnpacking(b,this->maxRange_var);
    doUnpacking(b,this->timeStamp_var);
}

const char * Query::getBusinessName() const
{
    return businessName_var.c_str();
}

void Query::setBusinessName(const char * businessName)
{
    this->businessName_var = businessName;
}

const char * Query::getBusinessType() const
{
    return businessType_var.c_str();
}

void Query::setBusinessType(const char * businessType)
{
    this->businessType_var = businessType;
}

Keywords& Query::getKeyWords()
{
    return keyWords_var;
}

void Query::setKeyWords(const Keywords& keyWords)
{
    this->keyWords_var = keyWords;
}

Coord& Query::getPeerLocation()
{
    return peerLocation_var;
}

void Query::setPeerLocation(const Coord& peerLocation)
{
    this->peerLocation_var = peerLocation;
}

double Query::getMaxRange() const
{
    return maxRange_var;
}

void Query::setMaxRange(double maxRange)
{
    this->maxRange_var = maxRange;
}

simtime_t Query::getTimeStamp() const
{
    return timeStamp_var;
}

void Query::setTimeStamp(simtime_t timeStamp)
{
    this->timeStamp_var = timeStamp;
}

class QueryDescriptor : public cClassDescriptor
{
  public:
    QueryDescriptor();
    virtual ~QueryDescriptor();

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

Register_ClassDescriptor(QueryDescriptor);

QueryDescriptor::QueryDescriptor() : cClassDescriptor("Query", "ApplPkt")
{
}

QueryDescriptor::~QueryDescriptor()
{
}

bool QueryDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<Query *>(obj)!=NULL;
}

const char *QueryDescriptor::getProperty(const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int QueryDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 6+basedesc->getFieldCount(object) : 6;
}

unsigned int QueryDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISCOMPOUND,
        FD_ISCOMPOUND | FD_ISCOBJECT | FD_ISCOWNEDOBJECT,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
    };
    return (field>=0 && field<6) ? fieldTypeFlags[field] : 0;
}

const char *QueryDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "businessName",
        "businessType",
        "keyWords",
        "peerLocation",
        "maxRange",
        "timeStamp",
    };
    return (field>=0 && field<6) ? fieldNames[field] : NULL;
}

int QueryDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='b' && strcmp(fieldName, "businessName")==0) return base+0;
    if (fieldName[0]=='b' && strcmp(fieldName, "businessType")==0) return base+1;
    if (fieldName[0]=='k' && strcmp(fieldName, "keyWords")==0) return base+2;
    if (fieldName[0]=='p' && strcmp(fieldName, "peerLocation")==0) return base+3;
    if (fieldName[0]=='m' && strcmp(fieldName, "maxRange")==0) return base+4;
    if (fieldName[0]=='t' && strcmp(fieldName, "timeStamp")==0) return base+5;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *QueryDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "string",
        "string",
        "Keywords",
        "Coord",
        "double",
        "simtime_t",
    };
    return (field>=0 && field<6) ? fieldTypeStrings[field] : NULL;
}

const char *QueryDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
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

int QueryDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    Query *pp = (Query *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string QueryDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    Query *pp = (Query *)object; (void)pp;
    switch (field) {
        case 0: return oppstring2string(pp->getBusinessName());
        case 1: return oppstring2string(pp->getBusinessType());
        case 2: {std::stringstream out; out << pp->getKeyWords(); return out.str();}
        case 3: {std::stringstream out; out << pp->getPeerLocation(); return out.str();}
        case 4: return double2string(pp->getMaxRange());
        case 5: return double2string(pp->getTimeStamp());
        default: return "";
    }
}

bool QueryDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    Query *pp = (Query *)object; (void)pp;
    switch (field) {
        case 0: pp->setBusinessName((value)); return true;
        case 1: pp->setBusinessType((value)); return true;
        case 4: pp->setMaxRange(string2double(value)); return true;
        case 5: pp->setTimeStamp(string2double(value)); return true;
        default: return false;
    }
}

const char *QueryDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        case 2: return opp_typename(typeid(Keywords));
        case 3: return opp_typename(typeid(Coord));
        default: return NULL;
    };
}

void *QueryDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    Query *pp = (Query *)object; (void)pp;
    switch (field) {
        case 2: return (void *)(&pp->getKeyWords()); break;
        case 3: return (void *)static_cast<cObject *>(&pp->getPeerLocation()); break;
        default: return NULL;
    }
}


