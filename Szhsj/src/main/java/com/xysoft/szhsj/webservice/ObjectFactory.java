package com.xysoft.szhsj.webservice;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;

/**
 * This object contains factory methods for each Java content interface and Java
 * element interface generated in the com.xysoft.szhsj.webservice package.
 * <p>
 * An ObjectFactory allows you to programatically construct new instances of the
 * Java representation for XML content. The Java representation of XML content
 * can consist of schema derived interfaces and classes representing the binding
 * of schema type definitions, element declarations and model groups. Factory
 * methods for each of these are provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

	private final static QName _GetData_QNAME = new QName(
			"http://service.BC.mgear.com/", "getData");
	private final static QName _UpFile_QNAME = new QName(
			"http://service.BC.mgear.com/", "upFile");
	private final static QName _UpFileResponse_QNAME = new QName(
			"http://service.BC.mgear.com/", "upFileResponse");
	private final static QName _DeleteFileResponse_QNAME = new QName(
			"http://service.BC.mgear.com/", "deleteFileResponse");
	private final static QName _SetData_QNAME = new QName(
			"http://service.BC.mgear.com/", "setData");
	private final static QName _DeleteFile_QNAME = new QName(
			"http://service.BC.mgear.com/", "deleteFile");
	private final static QName _SetDataResponse_QNAME = new QName(
			"http://service.BC.mgear.com/", "setDataResponse");
	private final static QName _GetDataResponse_QNAME = new QName(
			"http://service.BC.mgear.com/", "getDataResponse");

	/**
	 * Create a new ObjectFactory that can be used to create new instances of
	 * schema derived classes for package: com.xysoft.szhsj.webservice
	 * 
	 */
	public ObjectFactory() {
	}

	/**
	 * Create an instance of {@link GetData }
	 * 
	 */
	public GetData createGetData() {
		return new GetData();
	}

	/**
	 * Create an instance of {@link UpFile }
	 * 
	 */
	public UpFile createUpFile() {
		return new UpFile();
	}

	/**
	 * Create an instance of {@link SetData }
	 * 
	 */
	public SetData createSetData() {
		return new SetData();
	}

	/**
	 * Create an instance of {@link DeleteFile }
	 * 
	 */
	public DeleteFile createDeleteFile() {
		return new DeleteFile();
	}

	/**
	 * Create an instance of {@link UpFileResponse }
	 * 
	 */
	public UpFileResponse createUpFileResponse() {
		return new UpFileResponse();
	}

	/**
	 * Create an instance of {@link GetDataResponse }
	 * 
	 */
	public GetDataResponse createGetDataResponse() {
		return new GetDataResponse();
	}

	/**
	 * Create an instance of {@link DeleteFileResponse }
	 * 
	 */
	public DeleteFileResponse createDeleteFileResponse() {
		return new DeleteFileResponse();
	}

	/**
	 * Create an instance of {@link SetDataResponse }
	 * 
	 */
	public SetDataResponse createSetDataResponse() {
		return new SetDataResponse();
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link GetData }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.BC.mgear.com/", name = "getData")
	public JAXBElement<GetData> createGetData(GetData value) {
		return new JAXBElement<GetData>(_GetData_QNAME, GetData.class, null,
				value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link UpFile }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.BC.mgear.com/", name = "upFile")
	public JAXBElement<UpFile> createUpFile(UpFile value) {
		return new JAXBElement<UpFile>(_UpFile_QNAME, UpFile.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link UpFileResponse }
	 * {@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.BC.mgear.com/", name = "upFileResponse")
	public JAXBElement<UpFileResponse> createUpFileResponse(UpFileResponse value) {
		return new JAXBElement<UpFileResponse>(_UpFileResponse_QNAME,
				UpFileResponse.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link DeleteFileResponse }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.BC.mgear.com/", name = "deleteFileResponse")
	public JAXBElement<DeleteFileResponse> createDeleteFileResponse(
			DeleteFileResponse value) {
		return new JAXBElement<DeleteFileResponse>(_DeleteFileResponse_QNAME,
				DeleteFileResponse.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link SetData }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.BC.mgear.com/", name = "setData")
	public JAXBElement<SetData> createSetData(SetData value) {
		return new JAXBElement<SetData>(_SetData_QNAME, SetData.class, null,
				value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link DeleteFile }
	 * {@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.BC.mgear.com/", name = "deleteFile")
	public JAXBElement<DeleteFile> createDeleteFile(DeleteFile value) {
		return new JAXBElement<DeleteFile>(_DeleteFile_QNAME, DeleteFile.class,
				null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link SetDataResponse }
	 * {@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.BC.mgear.com/", name = "setDataResponse")
	public JAXBElement<SetDataResponse> createSetDataResponse(
			SetDataResponse value) {
		return new JAXBElement<SetDataResponse>(_SetDataResponse_QNAME,
				SetDataResponse.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link GetDataResponse }
	 * {@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.BC.mgear.com/", name = "getDataResponse")
	public JAXBElement<GetDataResponse> createGetDataResponse(
			GetDataResponse value) {
		return new JAXBElement<GetDataResponse>(_GetDataResponse_QNAME,
				GetDataResponse.class, null, value);
	}

}
